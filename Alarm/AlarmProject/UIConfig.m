//
//  Config.m
//  AlarmProject
//
//  Created by Dat Phan on 5/15/14.
//  Copyright (c) 2014 Dat Phan. All rights reserved.
//

#import "UIConfig.h"

static CGFloat screenW;
static CGFloat screenH;
static UIColor *screenBGColor;

static int aClockW;
static int aClockH;

static int sClockW;
static int sClockH;

static UIColor *sysClockColor;
static UIFont *sysClockFont;

static UIColor *alarmClockColor;
static UIFont *alarmClockFont;

static UIColor *arrowColor;
static UIColor *arrowColorPressed;

@implementation UIConfig

+ (void)initUI
{
    screenW = [[UIScreen mainScreen] bounds].size.width;
    screenH = [[UIScreen mainScreen] bounds].size.height;
    screenBGColor = [UIColor blackColor];
    
    sClockW = 50;
    sClockH = 50;
    
    aClockW = 120;
    aClockH = 120;
    NSString *fontName = @"Chalkboard SE";
    sysClockColor = [UIColor colorWithRed:0/255.0 green:255/255.0 blue:0/255.0 alpha:0.85];
    sysClockFont = [UIFont fontWithName:fontName size:34];
    
    alarmClockColor = [UIColor colorWithRed:233/255.0 green:47/255.0 blue:47/255.0 alpha:0.7];
    alarmClockFont = [UIFont fontWithName:fontName size:100];
    
    arrowColor = [UIColor blueColor];
    arrowColorPressed = [UIColor yellowColor];
}

+ (CGFloat)getScreenW
{
    return screenW;
}

+ (CGFloat)getScreenH
{
    return screenH;
}

+ (UIColor *)getScreenBGColor
{
    return screenBGColor;
}

+ (UIColor *)getSysClockColor
{
    return sysClockColor;
}

+ (int)getSClockWidth
{
    return sClockW;
}

+ (int)getSClockHeight
{
    return sClockH;
}

+ (int)getAClockWidth
{
    return aClockW;
}

+ (int)getAClockHeight
{
    return aClockH;
}

+ (UIFont *)getSysClockFont
{
    return sysClockFont;
}

+ (UIColor *)getAlarmClockColor
{
    return alarmClockColor;
}

+ (UIFont *)getAlarmClockFont
{
    return alarmClockFont;
}

+ (UIColor *)getArrowColor
{
    return arrowColor;
}

+ (UIColor *)getArrowColorPressed
{
    return arrowColorPressed;
}


@end
