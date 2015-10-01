//
//  HIHealthKitModel.m
//  Health_Insurance
//
//  Created by GIGIGUN on 2015/9/29.
//  Copyright © 2015年 GIGIGUN. All rights reserved.
//

#import "HIHealthKitModel.h"
#import <HealthKit/HealthKit.h>

@implementation HIHealthKitModel

+ (instancetype) getHealthKitInstance {
    static dispatch_once_t once;
    static HIHealthKitModel *instance;
    dispatch_once(&once, ^{
        instance = [[HIHealthKitModel alloc] init];
    });
    
    return instance;
}

-(void) HealthKit_RequestAutho
{
    if(NSClassFromString(@"HKHealthStore") && [HKHealthStore isHealthDataAvailable])
    {
        // Add your HealthKit code here
        HKHealthStore *healthStore = [[HKHealthStore alloc] init];
        
        // Share body mass, height and body mass index
        NSSet *shareObjectTypes = [NSSet setWithObjects:
                                   [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass],
                                   [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight],
                                   [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMassIndex],
                                   nil];
        
        // Read date of birth, biological sex and step count
        NSSet *readObjectTypes  = [NSSet setWithObjects:
                                   [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierDateOfBirth],
                                   [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierBiologicalSex],
                                   [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount],
                                   nil];
        
        // Request access
        [healthStore requestAuthorizationToShareTypes:shareObjectTypes
                                            readTypes:readObjectTypes
                                           completion:^(BOOL success, NSError *error) {
                                               
                                               if(success == YES)
                                               {
                                                   NSLog(@"Request HealthKit");
                                               }
                                               else
                                               {
                                                   // Determine if it was an error or if the
                                                   // user just canceld the authorization request
                                               }
                                               
                                           }];
    }
}


@end
