//
//  RGBColor.h
//  AlarmProject
//
//  Created by Dat Phan on 5/22/14.
//  Copyright (c) 2014 Dat Phan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RGBColor : NSObject

- (id)initWithRed:(int)red green:(int)green blue:(int)blue;

@property (nonatomic) int red;
@property (nonatomic) int green;
@property (nonatomic) int blue;

@end
