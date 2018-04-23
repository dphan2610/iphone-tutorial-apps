//
//  ViewController.m
//  KillTheRoaches
//
//  Created by Dat Phan on 4/23/18.
//  Copyright © 2018 Dat Phan. All rights reserved.
//

#import "HomeView.h"

@interface HomeView ()

@end

@implementation HomeView
@synthesize theme, cockroach, score, scoretext, boom;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    x = 50;
    y = 50;
    theme = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 570)];
    [theme setBackgroundColor:[UIColor colorWithRed:239/255.0 green:222/255.0 blue:205/255.0 alpha:1]];
    
    scoretext = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 200, 30)];
    [scoretext setFont:[UIFont fontWithName:@"Arial" size:20]];
    [scoretext setText:@"Roaches killed:"];
    
    score = [[UILabel alloc] initWithFrame:CGRectMake(250, 30, 80, 30)];
    [score setFont:[UIFont fontWithName:@"Arial" size:28]];
    [score setText:@"0"];
    
    cockroach = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, 100, 100)];
    [cockroach setImage:[UIImage imageNamed:@"nastyroach.png"]];
    [cockroach setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(smash)];
    [cockroach addGestureRecognizer:gesture];
    
    boom = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, 110, 110)];
    [boom setImage:[UIImage imageNamed:@"boom.png"]];
    [boom setHidden:YES];
    
    [self.view addSubview:theme];
    [self.view addSubview:scoretext];
    [self.view addSubview:score];[self.view addSubview:cockroach];[self.view addSubview:boom];
}

-(void)smash{
    [boom setFrame:CGRectMake(x, y, 110, 110)];
    [boom setHidden:NO];
    [self performSelector:@selector(newroach) withObject:nil afterDelay:0.16];
    
    num_of_roach++;
    [score setText:[NSString stringWithFormat:@"%d", num_of_roach]];
}

-(void)newroach{
    [boom setHidden:YES];
    x = arc4random() % 220;
    y = arc4random() % 430;
    [cockroach setFrame:CGRectMake(x, y, 100, 100)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
