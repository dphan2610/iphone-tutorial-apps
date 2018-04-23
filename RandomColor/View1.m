//
//  View1.m
//  RandomColor
//
//  Created by stars on 10/10/13.
//  Copyright (c) 2013 stars. All rights reserved.
//

#import "View1.h"

@interface View1 ()

@end

@implementation View1

@synthesize mainView, leftView, rightView, bottomView, titleLabel, bottomLabel, button;

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
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    
    CGFloat leftViewWidth = 25;
    CGFloat rightViewWidth = 40;
    
    CGFloat titleWidth = 200;
    CGFloat titleHeight = 60;
    
    CGFloat botLblWidth = 200;
    CGFloat botLblHeight = 50;
    
    UIColor *backgroundColor = [UIColor colorWithRed:243/255.0 green:252/255.0 blue:107/255.0 alpha:1];
    
    mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    [mainView setBackgroundColor:backgroundColor];
    [self.view addSubview:mainView];
    
    leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, leftViewWidth, screenHeight)];
    [leftView setBackgroundColor:[UIColor greenColor]];
    [mainView addSubview:leftView];
    
    rightView = [[UIView alloc] initWithFrame:CGRectMake(screenWidth - rightViewWidth, 0, rightViewWidth, screenHeight)];
    [rightView setBackgroundColor:[UIColor grayColor]];
    [mainView addSubview:rightView];
    
    bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, screenHeight - 35, screenWidth, 35)];
    [bottomView setBackgroundColor:[UIColor redColor]];
    [mainView addSubview:bottomView];
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((screenWidth - (leftViewWidth + rightViewWidth)) / 2 - (titleWidth / 2) + leftViewWidth, 10, titleWidth, titleHeight)];
    [titleLabel setText:@"APP TITLE"];
    [titleLabel setTextAlignment:1];
    [titleLabel setFont:[UIFont fontWithName:titleLabel.font.fontName size:30]];
    [titleLabel setTextColor:[UIColor redColor]];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [mainView addSubview:titleLabel];
    
    // 35 is the height of bottomView
    bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake((screenWidth - (leftViewWidth + rightViewWidth)) / 2 - (botLblWidth / 2) + leftViewWidth, screenHeight - botLblHeight - 35, botLblWidth, botLblHeight)];
    
    [bottomLabel setText:@"Designed by ABC"];
    [bottomLabel setTextAlignment:1];
    [bottomLabel setFont:[UIFont fontWithName:bottomLabel.font.fontName size:12]];
    [bottomLabel setTextColor:[UIColor brownColor]];
    [bottomLabel setBackgroundColor:[UIColor clearColor]];
    [mainView addSubview:bottomLabel];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake((screenWidth - (leftViewWidth + rightViewWidth)) / 2 - (150 / 2) + leftViewWidth, 300, 150, 45)];
    //[button setFrame:CGRectMake(60, 300, 150, 45)];
    [button setTitle:@"Change Color" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:button];
}

- (IBAction)click:(id)sender
{
    int red = arc4random() % 256;
    int green = arc4random() % 256;
    int blue = arc4random() % 256;
    
    NSLog(@"Red: %d, Green: %d, Blue: %d", red, green, blue);
    
    UIColor *color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
    [mainView setBackgroundColor:color];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
