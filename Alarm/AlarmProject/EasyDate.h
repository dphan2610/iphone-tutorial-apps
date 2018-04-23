//
//  EasyDate.h
//  AlarmProject
//
//  Created by Dat Phan on 5/18/14.
//  Copyright (c) 2014 Dat Phan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EasyDate : NSDate
{
    NSDate *currentDate;
}

+ (NSDate *)getCurrentDate;
- (NSString *)getHour;
- (NSString *)getMinute;

@end
