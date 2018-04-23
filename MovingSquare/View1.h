//
//  View1.h
//  MovingSquare
//
//  Created by Dat Phan on 10/10/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View1 : UIViewController
{
    int x;
    int y;
    
    bool moveRight;
    bool moveLeft;
    bool moveUp;
    bool moveDown;
}

@property (strong, nonatomic) UIView *mainView;

@property (strong, nonatomic) UIView *square;

@property (strong, nonatomic) UIButton *move;

@end
