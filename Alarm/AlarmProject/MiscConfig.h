//
//  MiscConfig.h
//  AlarmProject
//
//  Created by Dat Phan on 5/21/14.
//  Copyright (c) 2014 Dat Phan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MiscConfig : NSObject

+ (void)init;

+ (CFTimeInterval)getMinimumPressDuration;
+ (NSTimeInterval)getSpeed;

@end
