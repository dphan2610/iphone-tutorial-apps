//
//  Circle.h
//  AlarmProject
//
//  Created by Dat Phan on 5/21/14.
//  Copyright (c) 2014 Dat Phan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Star : UIView
{
    NSMutableArray *rgbArray;
    int widthSegment, heightSegment;
}

- (void)setupStarSmallDimBlue;
- (void)setupStarSmallBrightBlue;
- (void)setupStarTwinkleOrange;

@end
