//
//  View1.m
//  MovingSquare
//
//  Created by Dat Phan on 10/10/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import "View1.h"

@interface View1 ()

@end

@implementation View1

@synthesize mainView, square, move;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    x = 0;
    y = 0;
    
    moveRight = false;
    moveLeft = false;
    moveUp = false;
    moveDown = false;
    
    mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [mainView setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:mainView];
    
    square = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [square setBackgroundColor:[UIColor redColor]];
    [mainView addSubview:square];
    
    move = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [move setFrame:CGRectMake(125, 200, 80, 50)];
    [move addTarget:self action:@selector(move:) forControlEvents:UIControlEventTouchUpInside];
    [move setTitle:@"MOVE!" forState:UIControlStateNormal];
    [mainView addSubview:move];
}

- (IBAction)move:(id)sender
{
    if (0 <= x && x < 280 && y == 0) moveRight = true;
    else moveRight = false;
    
    if (0 <= y && y < 400 && x == 280) moveDown = true;
    else moveDown = false;
    
    if (0 < x && x <= 280 && y == 400) moveLeft = true;
    else moveLeft = false;
    
    if (0 < y && y <= 400 && x == 0) moveUp = true;
    else moveUp = false;
    
    if (moveRight) x += 40;
    if (moveLeft) x -= 40;
    if (moveDown) y += 40;
    if (moveUp) y -= 40;
        
    [square setFrame:CGRectMake(x, y, 40, 40)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
