//
//  FeedbackView.m
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 12/3/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import "FeedbackView.h"
#import "AppDelegate.h"

@interface FeedbackView ()

@end

@implementation FeedbackView

@synthesize mainView, background, titleBackground, instruction, userInput, previous, doneEditing, submit, home, message;
@synthesize ad;

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
    offset = 50;
    
    ad = [[UIApplication sharedApplication] delegate]; // A way to get variables or objects from AppDelegate
    
    [self setupInterface];
}

- (void)setupInterface
{
    mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 570)];
    [mainView setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:mainView];
    
    background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 570)];
    [background setBackgroundColor:[Config getBackgroundColor]];
    [mainView addSubview:background];
    
    titleBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 70)];
    [titleBackground setBackgroundColor:[Config getTitleBackgroundColor]];
    [self.view addSubview:titleBackground];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 320, 50)];
    [title setText:[Config getTitle]];
    [title setFont:[Config getTitleFont]];
    [title setTextAlignment:1];
    [title setTextColor:[Config getTitleTextColor]];
    [self.view addSubview:title];
    
    instruction = [[UILabel alloc] initWithFrame:CGRectMake(15, 15 + offset, 280, 80)];
    instruction.numberOfLines = 3;
    [instruction setText:@"Please let us know if you have any questions or concerns:"];
    [instruction setTextColor:[UIColor whiteColor]];
    [mainView addSubview:instruction];
    
    userInput = [[UITextView alloc] initWithFrame:CGRectMake(15, 105 + offset, 280, 100)];
    [userInput setText:[ad userFeedback]];
    [mainView addSubview:userInput];
    
    previous = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [previous setFrame:CGRectMake(5, 215 + offset, 70, 30)];
    [previous setTitle:@"Back" forState:UIControlStateNormal];
    [[previous titleLabel] setFont:[Config getButtonFont]];
    [previous setTitleColor:[Config getLinkTextColor] forState:UIControlStateNormal];
    [previous setTitleColor:[Config getButtonTextDisabledColor] forState:UIControlStateDisabled];
    [previous addTarget:self action:@selector(previous:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:previous];
    
    /*
    doneEditing = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [doneEditing setFrame:CGRectMake(160, 215 + offset, 70, 30)];
    [doneEditing setTitle:@"Done" forState:UIControlStateNormal];
    [[doneEditing titleLabel] setFont:[Config getButtonFont]];
    [doneEditing setTitleColor:[Config getLinkTextColor] forState:UIControlStateNormal];
    [doneEditing addTarget:self action:@selector(finishEditing:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:doneEditing];
     */
    
    submit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [submit setFrame:CGRectMake(225, 215 + offset, 70, 30)];
    [submit setTitle:@"Submit" forState:UIControlStateNormal];
    [[submit titleLabel] setFont:[Config getButtonFont]];
    [submit setTitleColor:[Config getLinkTextColor] forState:UIControlStateNormal];
    [submit setTitleColor:[Config getButtonTextDisabledColor] forState:UIControlStateDisabled];
    [submit addTarget:self action:@selector(submit:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:submit];
    
    message = [[UILabel alloc] initWithFrame:CGRectMake(15, 245 + offset, 200, 80)];
    message.numberOfLines = 3;
    [message setTextColor:[UIColor whiteColor]];
    [mainView addSubview:message];
    
    home = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [home setFrame:CGRectMake(225, 270 + offset, 70, 30)];
    [home setTitle:@"Home" forState:UIControlStateNormal];
    [[home titleLabel] setFont:[Config getButtonFont]];
    [home setTitleColor:[Config getLinkTextColor] forState:UIControlStateNormal];
    [home addTarget:self action:@selector(home:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:home];


}

- (IBAction)previous:(id)sender
{
    [[ad userFeedback] setString:[userInput text]]; // Save user feedback to the app delegate's variable
    [self.navigationController popViewControllerAnimated:YES];
}

/*
 * Hide the keyboard when user hits the button doneEditing
 */
- (IBAction)finishEditing:(id)sender
{
    [userInput resignFirstResponder]; // Hide keyboard
}

/*
 * Submit all user input to the database on server. They include:
 *      Multiple choice answers 
 *      Feedback
 */
- (IBAction)submit:(id)sender
{
    for (int i = 0; i < 5; i++) {
        NSLog(@"%@", [[ad userAnswers] objectAtIndex:i]);
    }
    NSString *string = [NSString stringWithFormat:@"http://www.remotepatientmonitoring.dreamhosters.com/InsertUserFeedback.php?patient_id=%d&&ans_to_Q1=%d&&ans_to_Q2=%d&&ans_to_Q3=%d&&ans_to_Q4=%d&&ans_to_Q5=%d&&additional_feedback=%@&&timestamp=%f", 1, [(NSNumber *)[[ad userAnswers] objectAtIndex:0] intValue], [(NSNumber *)[[ad userAnswers] objectAtIndex:1] intValue], [(NSNumber *)[[ad userAnswers] objectAtIndex:2] intValue], [(NSNumber *)[[ad userAnswers] objectAtIndex:3] intValue], [(NSNumber *)[[ad userAnswers] objectAtIndex:4] intValue], [userInput text], [[NSDate date] timeIntervalSince1970]];
    NSString *encodedString = [string stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]; // Encoded URL string using percent encoding
    
    NSURL *url = [NSURL URLWithString:encodedString];
    NSError *error;
    //[NSData dataWithContentsOfURL:url];
    [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    if (!error) { // If no error occurs
        
        // Disable submit button
        [submit setEnabled:NO];
        
        // Disable back button
        [previous setEnabled:NO];
        
        [message setText:@"Your answers have been successfully submitted!"];
        [userInput setUserInteractionEnabled:NO];
        
    } else { // If some error occurs
        [message setText:@"Failed to submit your answer. Please try again."];
    }
    
    [userInput resignFirstResponder]; // Hide keyboard
}

/*
 * Go back to patient home page
 */
- (IBAction)home:(id)sender
{
    /*
     *
     *  Set all user answers to -1
     *  Set user feedback to blank
     */
    for (int i = 0; i < [[ad userAnswers] count]; i++) {
        [[ad userAnswers] replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:-1]];
    }
    [[ad userFeedback] setString:@""];
    
    // Go to the patient's home page
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
