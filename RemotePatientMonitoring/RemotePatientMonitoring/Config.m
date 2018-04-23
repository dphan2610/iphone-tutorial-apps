//
//  Config.m
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 4/3/14.
//  Copyright (c) 2014 Dat Phan. All rights reserved.
//

#import "Config.h"

static UIColor *bgColor;
static UIColor *titleBgColor;
static UIColor *bodyBgColor;
static UIColor *titleTextColor;
static UIColor *linkTextColor;
static UIColor *buttonTextColor;
static UIColor *buttonBgColor;
static UIColor *buttonDisabledBgColor;
static UIColor *buttonTextDisabledColor;

static UIFont *textFont;
static UIFont *titleFont;
static UIFont *buttonFont;

static UIColor *lightYellow;

static NSString *title;

@implementation Config

+ (void)initColorTheme
{
    title = @"HEART RATE MONITOR";
    /*
    bgColor = [UIColor colorWithRed:255/255.0 green:161/255.0 blue:0.0/255.0 alpha:1];
    titleBgColor = [UIColor colorWithRed:255/255.0 green:203/255.0 blue:115/255.0 alpha:1];
    bodyBgColor = [UIColor colorWithRed:255/255.0 green:184/255.0 blue:64/255.0 alpha:1];
    titleTextColor = [UIColor colorWithRed:15/255.0 green:77/255.0 blue:168/255.0 alpha:1];
    */
    
    // Hue: 248 deg
    bgColor = [UIColor colorWithRed:22/255.0 green:46/255.0 blue:174/255.0 alpha:0.85];
    titleBgColor = [UIColor colorWithRed:74/255.0 green:96/255.0 blue:215/255.0 alpha:1];
    //bodyBgColor = [UIColor colorWithRed:112/255.0 green:128/255.0 blue:215/255.0 alpha:1];
    bodyBgColor = [UIColor colorWithRed:202/255.0 green:225/255.0 blue:255/255.0 alpha:1];
    titleTextColor = [UIColor colorWithRed:255/255.0 green:200/255.0 blue:64/255.0 alpha:1];
    linkTextColor = [UIColor colorWithRed:255/255.0 green:182/255.0 blue:0/255.0 alpha:1];
    buttonTextColor = [UIColor colorWithRed:166/255.0 green:118/255.0 blue:0/255.0 alpha:1];
    buttonBgColor = [UIColor greenColor];
    buttonDisabledBgColor = [UIColor lightGrayColor];
    buttonTextDisabledColor = [UIColor darkGrayColor];
    
    textFont = [UIFont fontWithName:@"Arial" size:18];
    titleFont = [UIFont fontWithName:@"MarkerFelt-Thin" size:30];
    buttonFont = [UIFont fontWithName:@"Arial" size:20];
    
    lightYellow = [UIColor colorWithRed:255/255.0 green:215/255.0 blue:115/255.0 alpha:1];
}

+ (NSString *)getTitle
{
    return title;
}
    
+ (UIColor *)getBackgroundColor
{
    //return [UIColor colorWithRed:255/255.0 green:161/255.0 blue:0.0/255.0 alpha:1];
    
    // Hue: 248 deg
    //return [UIColor colorWithRed:22/255.0 green:46/255.0 blue:174/255.0 alpha:1];
    
    return bgColor;
}

+ (UIColor *)getTitleBackgroundColor
{
    //return [UIColor colorWithRed:255/255.0 green:203/255.0 blue:115/255.0 alpha:1];
    
    // Hue: 248 deg
    //return [UIColor colorWithRed:74/255.0 green:96/255.0 blue:215/255.0 alpha:1];
    
    return titleBgColor;
}

+ (UIColor *)getBodyBackgroundColor
{
    //return [UIColor colorWithRed:255/255.0 green:184/255.0 blue:64/255.0 alpha:1];
    
    // Hue: 248 deg
    //return [UIColor colorWithRed:112/255.0 green:128/255.0 blue:215/255.0 alpha:1];
    
    return bodyBgColor;
}

+ (UIColor *)getTitleTextColor
{
    //return [UIColor colorWithRed:15/255.0 green:77/255.0 blue:168/255.0 alpha:1];
    
    // Hue: 248 deg
    //return [UIColor colorWithRed:191/255.0 green:150/255.0 blue:48/255.0 alpha:1];
    
    return titleTextColor;
}

+ (UIColor *)getLinkTextColor
{
    return linkTextColor;
    
}

+ (UIColor *)getButtonTextColor
{
    return buttonTextColor;
    
}

+ (UIColor *)getButtonBgColor
{
    return buttonBgColor;
}

+ (UIColor *)getButtonDisabledBgColor
{
    return buttonDisabledBgColor;
}

+ (UIColor *)getButtonTextDisabledColor
{
    return buttonTextDisabledColor;
}

+ (UIFont *)getTextFont
{
    return textFont;
}

+ (UIFont *)getTitleFont
{
    return titleFont;
}

+ (UIFont *)getButtonFont
{
    return buttonFont;
}

+ (UIColor *)getLightYellow
{
    return lightYellow;
}

@end
