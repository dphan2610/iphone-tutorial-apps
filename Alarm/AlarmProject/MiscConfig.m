//
//  MiscConfig.m
//  AlarmProject
//
//  Created by Dat Phan on 5/21/14.
//  Copyright (c) 2014 Dat Phan. All rights reserved.
//

#import "MiscConfig.h"

static CFTimeInterval minDuration;
static NSTimeInterval speed;

@implementation MiscConfig

+ (void)init
{
    minDuration = 0.55;
    speed = 0.3;
}

+ (CFTimeInterval)getMinimumPressDuration
{
    return minDuration;
}

+ (NSTimeInterval)getSpeed
{
    return speed;
}

@end
