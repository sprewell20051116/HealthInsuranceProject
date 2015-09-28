//
//  PlistUtilities.h
//  Health_Insurance
//
//  Created by GIGIGUN on 2015/9/28.
//  Copyright © 2015年 GIGIGUN. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PLIST_SETTING_VERSION_KEY   @"Version"
#define PLIST_SETTING_USER_NAME_KEY @"UserName"
#define PLIST_SETTING_TUTORIAL_KEY  @"SeenTutor"
//#define PLIST_SETTING_PW_LENGTH_KEY @"PWLength"

@interface PlistUtilities : NSObject
+(void) init_Plist;
+(void) Plist_SettingTutorialSeen;
+(BOOL) Plist_GetTutorialSeen;
+(void) Plist_SetUserName : (NSString *) UserNameStr;
+(NSString*) Plist_GetUserName;
@end
