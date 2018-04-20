//
//  View1.h
//  WalkingCharacterGame
//
//  Created by Dat Phan on 12/23/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View1 : UIViewController
{
    int x;
    int y;
    
    int centerX;
    int centerY;
    
    int xTree;
    int yTree;
    
    int xHouse;
    int yHouse;
    
    int xEnemy;
    int yEnemy;
    
    bool isMovingUp;
    bool isMovingDown;
    bool isMovingLeft;
    bool isMovingRight;
    
    int indexUp;
    int indexDown;
    int indexLeft;
    int indexRight;
    
    int limit;
    int random;
    
    double animateDurationCharacter;
    double animateDurationEnemy;
    int pixelSpeed;
    int objectPixelSpeed;
    
    bool test;
}

@property (strong, nonatomic) UIView *mainView;

@property (strong, nonatomic) UIView *square;

@property (strong, nonatomic) UIButton *upButton;
@property (strong, nonatomic) UIButton *downButton;
@property (strong, nonatomic) UIButton *leftButton;
@property (strong, nonatomic) UIButton *rightButton;

@property (strong, nonatomic) UIImageView *character;
@property (strong, nonatomic) UIImageView *tree;
@property (strong, nonatomic) UIImageView *house;
@property (strong, nonatomic) UIImageView *enemy;

@property (strong, nonatomic) NSArray *imagesWalkingUp;
@property (strong, nonatomic) NSArray *imagesWalkingDown;
@property (strong, nonatomic) NSArray *imagesWalkingLeft;
@property (strong, nonatomic) NSArray *imagesWalkingRight;


@property (strong, nonatomic) NSArray *bricks;


@end
