//
//  ArrowUp.m
//  AlarmProject
//
//  Created by Dat Phan on 5/17/14.
//  Copyright (c) 2014 Dat Phan. All rights reserved.
//

#import "ArrowUp.h"

@implementation ArrowUp

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setCurrentColor:(UIColor *)c
{
    currentColor = c;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGContextMoveToPoint(context, 0, [self bounds].size.height);
    CGContextAddLineToPoint(context, [self bounds].size.width / 2, 0);
    CGContextAddLineToPoint(context, [self bounds].size.width, [self bounds].size.height);
    CGContextAddLineToPoint(context, 0, [self bounds].size.height);
    
    if (currentColor == nil) currentColor = [UIColor purpleColor];
    CGContextSetFillColorWithColor(context, currentColor.CGColor);
    CGContextFillPath(context);
    
}



@end
