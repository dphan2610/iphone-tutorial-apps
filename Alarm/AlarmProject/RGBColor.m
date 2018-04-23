//
//  RGBColor.m
//  AlarmProject
//
//  Created by Dat Phan on 5/22/14.
//  Copyright (c) 2014 Dat Phan. All rights reserved.
//

#import "RGBColor.h"

@implementation RGBColor

- (id)initWithRed:(int)red green:(int)green blue:(int)blue
{
    self = [super init];
    if (self) {
        self.red = red;
        self.green = green;
        self.blue = blue;
    }
    
    return self;
}

@end
