//
//  ExerciseFinishedView.m
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 11/4/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import "ExerciseFinishedView.h"

@interface ExerciseFinishedView ()

@end

@implementation ExerciseFinishedView

@synthesize mainView, background, bodyBackground, titleBackground, instructionText, next;

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
    bodyY = 185, bodyH = 140;
    dist = 5;
    
    mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 570)];
    [self.view addSubview:mainView];
    
    background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 570)];
    [background setBackgroundColor:[Config getBackgroundColor]];
    [self.view addSubview:background];
    
    titleBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 70)];
    [titleBackground setBackgroundColor:[Config getTitleBackgroundColor]];
    [self.view addSubview:titleBackground];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 320, 50)];
    //[title setBackgroundColor:[UIColor colorWithRed:255/255.0 green:184/255.0 blue:64/255.0 alpha:1]];
    [title setText:[Config getTitle]];
    [title setFont:[Config getTitleFont]];
    [title setTextAlignment:1];
    [title setTextColor:[Config getTitleTextColor]];
    [self.view addSubview:title];
    
    bodyBackground = [[UIView alloc] initWithFrame:CGRectMake(0, bodyY, 320, bodyH)];
    [bodyBackground setBackgroundColor:[Config getBodyBackgroundColor]];
    [self.view addSubview:bodyBackground];
    
    instructionText = [[UILabel alloc] initWithFrame:CGRectMake(25, 200, 270, 100)];
    instructionText.numberOfLines = 3;
    [instructionText setFont:[Config getTextFont]];
    [instructionText setText:@"You have finished your exercise session. Hit Next to start the survey."];
    [self.view addSubview:instructionText];
    
    next = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [next setFrame:CGRectMake(245, bodyY + bodyH + dist, 50, 30)];
    [next setTitle:@"Next" forState:UIControlStateNormal];
    [[next titleLabel] setFont:[Config getButtonFont]];
    [next setTitleColor:[Config getLinkTextColor] forState:UIControlStateNormal];
    [next addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:next];
}

- (IBAction)next:(id)sender
{
    SurveyView *viewSurvey = [[SurveyView alloc] init];
    [self.navigationController pushViewController:viewSurvey animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
