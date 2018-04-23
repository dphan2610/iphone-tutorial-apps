//
//  MathUtility.m
//  AlarmProject
//
//  Created by Dat Phan on 5/23/14.
//  Copyright (c) 2014 Dat Phan. All rights reserved.
//

#import "MathUtility.h"

@implementation MathUtility

+ (double)getRandomFromMin:(double)min max:(double)max decimals:(int)dec
{
    int powDec = pow(10, dec);
    int minInteger = min * powDec;
    int maxInteger = max * powDec;
    int randomInt = arc4random_uniform(maxInteger - minInteger + 1) + minInteger;
    return (double)randomInt / powDec;
}

- (double)calculateExpFromBase:(double)base exponent:(int)exp
{
    if (exp == 0) return 1;
    else {
        double result = 1;
        int posExp = abs(exp);
        for (int i = 0; i < posExp; ++i) {
            result = result * base;
        }
        if (exp < 0) result = 1 / result;
        return result;
    }
}

@end
