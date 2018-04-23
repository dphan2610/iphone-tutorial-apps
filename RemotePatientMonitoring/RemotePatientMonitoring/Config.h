//
//  Config.h
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 4/3/14.
//  Copyright (c) 2014 Dat Phan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Config : NSObject
{
    
}

+ (void)initColorTheme;

+ (UIColor *)getBackgroundColor;    
+ (UIColor *)getTitleBackgroundColor;
+ (UIColor *)getBodyBackgroundColor;
+ (UIColor *)getButtonTextColor;
+ (UIColor *)getButtonBgColor;
+ (UIColor *)getButtonDisabledBgColor;
+ (UIColor *)getButtonTextDisabledColor;

+ (UIColor *)getTitleTextColor;
+ (UIColor *)getLinkTextColor;

+ (UIFont *)getTextFont;
+ (UIFont *)getTitleFont;
+ (UIFont *)getButtonFont;

+ (NSString *)getTitle;

+ (UIColor *)getLightYellow;

@end
