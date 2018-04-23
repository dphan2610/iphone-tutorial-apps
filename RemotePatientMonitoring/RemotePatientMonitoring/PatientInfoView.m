//
//  PatientInfoView.m
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 11/19/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import "PatientInfoView.h"

@interface PatientInfoView ()

@end

@implementation PatientInfoView

@synthesize mainView, background, title, titleBackground, idIndicator, nameIndicator, weightIndicator, heightIndicator, patientID, patientName, patientWeight, patientHeight, weightUnit, heightUnit, bodyBackground, startSession, signOut;
@synthesize identification, patient;

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
    identification = 1;
    
    offset = 50;
    bodyY = 130;
    distA = 35;
    distB = 5;
    bodyH = 200;
    
    [self setPatientInfo]; // setPatientInfo is called before setupInferface
    [self setupInterface];
}

/*
 * Get patient information from the web server
 * and put it in the Patient object
 */
- (void)setPatientInfo
{
    NSString *string = [NSString stringWithFormat:@"http://www.remotepatientmonitoring.dreamhosters.com/GetPatientInfo.php?patientID=%d", identification];
    NSURL *url = [NSURL URLWithString:string];
    NSString *originalResult = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSArray *result = [originalResult componentsSeparatedByString:@"|"];
    patient = [[Patient alloc] initWithID:identification lastName:[result objectAtIndex:0] firstName:[result objectAtIndex:1] weightInInches: [[result objectAtIndex:2] intValue] heightInPounds:[[result objectAtIndex:3] intValue]];
    
    NSLog(@"%@", patient);
}

/*
 * Initialize all UI component, including labels and buttons
 */
- (void)setupInterface
{
    mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 570)];
    //[mainView setBackgroundColor:[UIColor colorWithRed:170/255.0 green:199/255.0 blue:159/255.0 alpha:1]];
    [self.view addSubview:mainView];
    
    background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 570)];
    [background setBackgroundColor:[Config getBackgroundColor]];
    [mainView addSubview:background];
    
    titleBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 70)];
    [titleBackground setBackgroundColor:[Config getTitleBackgroundColor]];
    [self.view addSubview:titleBackground];
    
    bodyBackground = [[UIView alloc] initWithFrame:CGRectMake(0, bodyY, 320, bodyH)];
    [bodyBackground setBackgroundColor:[Config getBodyBackgroundColor]];
    [self.view addSubview:bodyBackground];
    
    title = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 320, 50)];
    //[title setBackgroundColor:[UIColor colorWithRed:255/255.0 green:184/255.0 blue:64/255.0 alpha:1]];
    [title setText:[Config getTitle]];
    [title setFont:[Config getTitleFont]];
    [title setTextAlignment:1];
    [title setTextColor:[Config getTitleTextColor]];
    [self.view addSubview:title];
    
    [self initInfoLabels];
    [self initButtons];
}

/*
 * Initialize labels (for holding name indicator, patient's name, etc)
 */
- (void) initInfoLabels
{
    idIndicator = [[UILabel alloc] initWithFrame:CGRectMake(15, bodyY + distA, 70, 30)];
    //[idIndicator setBackgroundColor:labelBackgroundColor];
    [idIndicator setTextAlignment:2];
    [idIndicator setText:@"ID:"];
    [idIndicator setFont:[Config getTextFont]];
    [self.view addSubview:idIndicator];
    
    nameIndicator = [[UILabel alloc] initWithFrame:CGRectMake(15, bodyY + distA * 2, 70, 30)];
    //[nameIndicator setBackgroundColor:labelBackgroundColor];
    [nameIndicator setTextAlignment:2];
    [nameIndicator setText:@"Name:"];
    [nameIndicator setFont:[Config getTextFont]];
    [self.view addSubview:nameIndicator];
    
    weightIndicator = [[UILabel alloc] initWithFrame:CGRectMake(15, bodyY + distA * 3, 70, 30)];
    //[weightIndicator setBackgroundColor:labelBackgroundColor];
    [weightIndicator setTextAlignment:2];
    [weightIndicator setText:@"Weight:"];
    [weightIndicator setFont:[Config getTextFont]];
    [self.view addSubview:weightIndicator];
    
    heightIndicator = [[UILabel alloc] initWithFrame:CGRectMake(15, bodyY + distA * 4, 70, 30)];
    //[heightIndicator setBackgroundColor:labelBackgroundColor];
    [heightIndicator setTextAlignment:2];
    [heightIndicator setText:@"Height:"];
    [heightIndicator setFont:[Config getTextFont]];
    [self.view addSubview:heightIndicator];
    
    patientID = [[UILabel alloc] initWithFrame:CGRectMake(100, bodyY + distA, 200, 30)];
    [patientID setFont:[Config getTextFont]];
    [patientID setText:[NSString stringWithFormat:@"%d", [patient identification]]]; // Display patient ID
    [self.view addSubview:patientID];
    
    patientName = [[UILabel alloc] initWithFrame:CGRectMake(100, bodyY + distA * 2, 200, 30)];
    UIFont *font = [UIFont fontWithName:@"Arial" size:25];
    [patientName setFont:font];
    //[patientName setBackgroundColor:labelBackgroundColor];
    [patientName setText:[NSString stringWithFormat:@"%@ %@", [patient firstName], [patient lastName]]]; // Display patient name
    [self.view addSubview:patientName];
    
    patientWeight = [[UILabel alloc] initWithFrame:CGRectMake(100, bodyY + distA * 3, 70, 30)];
    [patientWeight setFont:[Config getTextFont]];
    [patientWeight setText:[NSString stringWithFormat:@"%d", [patient weightInPounds]]]; // Display patient weight
    [self.view addSubview:patientWeight];
    
    patientHeight = [[UILabel alloc] initWithFrame:CGRectMake(100, bodyY + distA * 4, 70, 30)];
    [patientHeight setFont:[Config getTextFont]];
    [patientHeight setText:[NSString stringWithFormat:@"%d", [patient heightInInches]]]; // Display patient height
    [self.view addSubview:patientHeight];
    
    weightUnit = [[UILabel alloc] initWithFrame:CGRectMake(160, bodyY + distA * 3, 70, 30)];
    [weightUnit setFont:[Config getTextFont]];
    [weightUnit setText:@"kg"];
    [self.view addSubview:weightUnit];
    
    heightUnit = [[UILabel alloc] initWithFrame:CGRectMake(160, bodyY + distA * 4, 70, 30)];
    [heightUnit setFont:[Config getTextFont]];
    [heightUnit setText:@"cm"];
    [self.view addSubview:heightUnit];
}

/*
 * Initialize buttons:
 *      start, log out, exit
 */
- (void)initButtons
{
    startSession = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [startSession setBackgroundColor:[Config getLightYellow]];
    [[startSession layer] setMasksToBounds:YES];
    [[startSession layer] setCornerRadius:9.0f];
    [startSession setFrame:CGRectMake(150, bodyY + bodyH + distB, 150, 40)];
    [[startSession titleLabel] setFont:[Config getButtonFont]];
    [startSession setTitle:@"Start Session" forState:UIControlStateNormal];
    [startSession setTitleColor:[Config getButtonTextColor] forState:UIControlStateNormal];
    [startSession addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startSession];
    
    signOut= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [signOut setFrame:CGRectMake(15, bodyY + bodyH + distB, 100, 40)];
    [[signOut titleLabel] setFont:[Config getButtonFont]];
    [signOut setTitle:@"Sign Out" forState:UIControlStateNormal];
    [signOut setTitleColor:[Config getLinkTextColor] forState:UIControlStateNormal];
    [signOut addTarget:self action:@selector(signOut:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signOut];
}

/*
 * Press 'Start' button
 */
- (IBAction)start:(id)sender
{
    ConnectDeviceView *view = [[ConnectDeviceView alloc] init];
    [self.navigationController pushViewController:view animated:YES];
}

/*
 * Press 'Sign Out' button
 */
- (IBAction)signOut:(id)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
