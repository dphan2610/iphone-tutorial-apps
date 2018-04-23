//
//  Config.h
//  AlarmProject
//
//  Created by Dat Phan on 5/15/14.
//  Copyright (c) 2014 Dat Phan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIConfig : NSObject

+ (void)initUI;

+ (CGFloat)getScreenW;
+ (CGFloat)getScreenH;
+ (UIColor *)getScreenBGColor;

+ (int)getAClockWidth;
+ (int)getAClockHeight;
+ (int)getSClockWidth;
+ (int)getSClockHeight;

+ (UIColor *)getSysClockColor;
+ (UIFont *)getSysClockFont;

+ (UIColor *)getAlarmClockColor;
+ (UIFont *)getAlarmClockFont;

+ (UIColor *)getArrowColor;
+ (UIColor *)getArrowColorPressed;

@end
