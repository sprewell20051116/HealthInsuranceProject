//
//  PlistUtilities.m
//  Health_Insurance
//
//  Created by GIGIGUN on 2015/9/28.
//  Copyright © 2015年 GIGIGUN. All rights reserved.
//

#import "PlistUtilities.h"

@implementation PlistUtilities

#pragma mark -
#pragma mark Private Methods

+(void) init_Plist 
{
    NSString *destPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    destPath = [destPath stringByAppendingPathComponent:@"HIData.plist"]; // If the file doesn't exist in the Documents Folder, copy it.
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:destPath]) {
        NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"HIData" ofType:@"plist"];
        [fileManager copyItemAtPath:sourcePath toPath:destPath error:nil];
    }
    
    NSMutableDictionary *plistDict;
    if ([fileManager fileExistsAtPath:destPath]) //檢查檔案是否存在
    {
        plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:destPath];
    }else{
        plistDict = [[NSMutableDictionary alloc] init];
    }
    
    //NSLog(@"[cc] test %@", plistDict);
}

+(NSMutableDictionary*) Read_SettingList
{
    NSString *destPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    destPath = [destPath stringByAppendingPathComponent:@"HIData.plist"]; // If the file doesn't exist in the Documents Folder, copy it.
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSMutableDictionary *plistDict;
    
    if ([fileManager fileExistsAtPath:destPath]) //檢查檔案是否存在
    {
        plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:destPath];
    }
    
    return plistDict;
}


+(BOOL) Write_SettingListWithDictionary : (NSDictionary*) plistDic
{
    
    NSString *destPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    destPath = [destPath stringByAppendingPathComponent:@"HIData.plist"]; // If the file doesn't exist in the Documents Folder, copy it.
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:destPath]) {
        
        if ([plistDic writeToFile:destPath atomically: YES]) {
            
            return YES;
            
        } else {
            
            return NO;
        }
        
    } else {
        NSLog(@"File not exist");
        return NO;
    }
    
}

+(void) Plist_SettingTutorialSeen
{
    NSMutableDictionary *Dic = [self Read_SettingList];
    [Dic setObject:[NSNumber numberWithBool:YES] forKey:PLIST_SETTING_TUTORIAL_KEY];
    [self Write_SettingListWithDictionary:Dic];
}

+(BOOL) Plist_GetTutorialSeen
{
    if (nil == [[PlistUtilities Read_SettingList] objectForKey:PLIST_SETTING_TUTORIAL_KEY]) {
        return NO;
    } else {
        return [[[PlistUtilities Read_SettingList] objectForKey:PLIST_SETTING_TUTORIAL_KEY] boolValue];
    }
}

+(void) Plist_SetUserName : (NSString *) UserNameStr
{
    NSMutableDictionary *Dic = [PlistUtilities Read_SettingList];
    [Dic setObject:UserNameStr forKey:PLIST_SETTING_USER_NAME_KEY];
    [PlistUtilities Write_SettingListWithDictionary:Dic];
}


+(NSString*) Plist_GetUserName
{
    if (nil == [[PlistUtilities Read_SettingList] objectForKey:PLIST_SETTING_USER_NAME_KEY]) {
        return nil;
    } else {
        return [[PlistUtilities Read_SettingList] objectForKey:PLIST_SETTING_USER_NAME_KEY];
    }
}
@end
