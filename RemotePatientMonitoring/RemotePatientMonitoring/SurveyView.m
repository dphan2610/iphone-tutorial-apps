//
//  Survey.m
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 11/4/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import "SurveyView.h"
#import "AppDelegate.h"

@interface SurveyView ()

@end

@implementation SurveyView

@synthesize mainView, background, titleBackground, question, answerChoice1, answerChoice2, answerChoice3, answerChoice4, next, previous, questionSet, answerLabels, warningMessage;
@synthesize qColor, aColor, aSelectedColor;
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
    offset = 100;
    
    ad = [[UIApplication sharedApplication] delegate]; // A way to get variables or objects from AppDelegate
    
    // Setting up UI components
    //qColor = [[UIColor alloc] initWithRed:224/255.0 green:228/255.0 blue:250/255.0 alpha:1]; // set question background color (almost white)
    qColor = [UIColor colorWithRed:202/255.0 green:225/255.0 blue:255/255.0 alpha:1];
    //aColor = [[UIColor alloc] initWithRed:192/255.0 green:255/255.0 blue:184/255.0 alpha:1]; // set answer background color
    //aColor = [UIColor colorWithRed:112/255.0 green:128/255.0 blue:215/255.0 alpha:0.5];
    aColor = [[UIColor alloc] initWithRed:224/255.0 green:228/255.0 blue:250/255.0 alpha:1];
    
    //aSelectedColor = [[UIColor alloc] initWithRed:20/255.0 green:221/255.0 blue:150/255.0 alpha:1];
    aSelectedColor = [UIColor colorWithRed:255/255.0 green:215/255.0 blue:115/255.0 alpha:1];
    
    for (int i = 1; i < 6; i++) {
        // Make a PHP request to get question number i
        
        
        // Add new question object (initialized with data from the request) to array
    }
    
    [self setupInterface];
    Question *q1 = [[Question alloc] initWithQuestion:@"1. How tired did you get during exercises?" choice1:@"Not tired" choice2:@"A little tired" choice3:@"More tired" choice4:@"Too tired"];
    Question *q2 = [[Question alloc] initWithQuestion:@"2. How was your breathing during exercise?" choice1:@"Normal breathing" choice2:@"More breathing" choice3:@"Heavy breathing" choice4:@"Out of breath"];
    Question *q3 = [[Question alloc] initWithQuestion:@"3. How much pain did you feel during exercise?" choice1:@"No pain" choice2:@"A little pain" choice3:@"More pain" choice4:@"Too much pain"];
    Question *q4 = [[Question alloc] initWithQuestion:@"4. How hard was the exercise?" choice1:@"Too easy" choice2:@"A little hard" choice3:@"More hard" choice4:@"Too hard"];
    Question *q5 = [[Question alloc] initWithQuestion:@"5. How much did you like the exercises?" choice1:@"Did not like" choice2:@"Like a little" choice3:@"Liked more" choice4:@"Liked a lot"];
    
    questionSet = [[NSArray alloc] initWithObjects:q1, q2, q3, q4, q5, nil];
    
    current = 0;
    [question setText:[(Question *)[questionSet objectAtIndex:0] question]];
    [answerChoice1 setText:[(Question *)[questionSet objectAtIndex:0] answerChoice1]];
    [answerChoice2 setText:[(Question *)[questionSet objectAtIndex:0] answerChoice2]];
    [answerChoice3 setText:[(Question *)[questionSet objectAtIndex:0] answerChoice3]];
    [answerChoice4 setText:[(Question *)[questionSet objectAtIndex:0] answerChoice4]];
    
    currentSelectedAnswer = -1;
    
    // Initially, user answer for each question is -1 (no answer)
    
    /* --------------RE-IMPLEMENTED!------------------------
     *      We now use NSMutableArray object userAnswers to keep track of answers instead of using int []
     *
     *      userAnswers is initialized and declared in AppDelegate.h
     */
    //userAnswer[0] = -1;
    //userAnswer[1] = -1;
    //userAnswer[2] = -1;
    //userAnswer[3] = -1;
    //userAnswer[4] = -1;
}

/*
 * Initialize user interface component. In this method, the following is initialized:
 *      position, size, background color, line numbers, button text, button target
 * 
 * Represents "View" code
 */
- (void) setupInterface
{

    // Main view
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
    
    // Question label
    question = [[UILabel alloc] initWithFrame:CGRectMake(0, 15 + offset, 320, 80)];
    [question setBackgroundColor:qColor];
    [question setTextColor:[UIColor blackColor]];
    question.numberOfLines = 3;
    [question setTextAlignment:1];
    [question setFont:[Config getTextFont]];
    [self.view addSubview:question];
    
    // 1st answer label
    answerChoice1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 100 + offset, 250, 50)];
    [answerChoice1 setBackgroundColor:aColor];
    answerChoice1.numberOfLines = 2;
    [answerChoice1 setTextAlignment:1];
    [answerChoice1 setTextColor:[UIColor blackColor]];
    [answerChoice1 setFont:[Config getTextFont]];
    answerChoice1.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectAns1)];
    [answerChoice1 addGestureRecognizer:tapGesture1];
    
    [self.view addSubview:answerChoice1];
    
    // 2nd answer label
    answerChoice2 = [[UILabel alloc] initWithFrame:CGRectMake(30, 160 + offset, 250, 50)];
    [answerChoice2 setBackgroundColor:aColor];
    answerChoice2.numberOfLines = 2;
    [answerChoice2 setTextAlignment:1];
    [answerChoice2 setTextColor:[UIColor blackColor]];
    [answerChoice2 setFont:[Config getTextFont]];
    answerChoice2.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectAns2)];
    [answerChoice2 addGestureRecognizer:tapGesture2];

    [self.view addSubview:answerChoice2];
    
    // 3rd answer label
    answerChoice3 = [[UILabel alloc] initWithFrame:CGRectMake(30, 220 + offset, 250, 50)];
    [answerChoice3 setBackgroundColor:aColor];
    answerChoice3.numberOfLines = 2;
    [answerChoice3 setTextAlignment:1];
    [answerChoice3 setTextColor:[UIColor blackColor]];
    [answerChoice3 setFont:[Config getTextFont]];
    answerChoice3.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectAns3)];
    [answerChoice3 addGestureRecognizer:tapGesture3];

    [self.view addSubview:answerChoice3];
    
    // 4th answer label
    answerChoice4 = [[UILabel alloc] initWithFrame:CGRectMake(30, 280 + offset, 250, 50)];
    [answerChoice4 setBackgroundColor:aColor];
    answerChoice4.numberOfLines = 2;
    [answerChoice4 setTextAlignment:1];
    [answerChoice4 setTextColor:[UIColor blackColor]];
    [answerChoice4 setFont:[Config getTextFont]];
    answerChoice4.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectAns4)];
    [answerChoice4 addGestureRecognizer:tapGesture4];

    [self.view addSubview:answerChoice4];
    
    warningMessage = [[UILabel alloc] initWithFrame:CGRectMake(30, 325 + offset, 250, 60)];
    //[warningMessage setBackgroundColor:[UIColor redColor]];
    warningMessage.numberOfLines = 2;
    [warningMessage setTextColor:[UIColor whiteColor]];
    [self.view addSubview:warningMessage];
    
    // Next button
    next = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [next setFrame:CGRectMake(200, 410 + offset, 100, 40)];
    [next setBackgroundColor:[Config getLightYellow]];
    [[next layer] setMasksToBounds:YES];
    [[next layer] setCornerRadius:9.0f];
    [next setTitle:@"Next" forState:UIControlStateNormal];
    [[next titleLabel] setFont:[Config getButtonFont]];
    [next setTitleColor:[Config getButtonTextColor] forState:UIControlStateNormal];
    [next addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:next];
    
    // Back button
    previous = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [previous setFrame:CGRectMake(15, 415 + offset, 60, 30)];
    [previous setTitle:@"Back" forState:UIControlStateNormal];
    [[previous titleLabel] setFont:[Config getButtonFont]];
    [previous setTitleColor:[Config getLinkTextColor] forState:UIControlStateNormal];
    [previous addTarget:self action:@selector(previous:) forControlEvents:UIControlEventTouchUpInside];
    [previous setHidden:YES]; // Hide the back button
    [self.view addSubview:previous];
    
    answerLabels = [[NSArray alloc] initWithObjects:answerChoice1, answerChoice2, answerChoice3, answerChoice4, nil];
}

/*
 * Update the content of the question and its corresponding answers
 *
 * Represents "Controller" code
 */
- (void)updateContentOfLabels:(int)index
{
    [question setText:[(Question *)[questionSet objectAtIndex:index] question]];
    [answerChoice1 setText:[(Question *)[questionSet objectAtIndex:index] answerChoice1]];
    [answerChoice2 setText:[(Question *)[questionSet objectAtIndex:index] answerChoice2]];
    [answerChoice3 setText:[(Question *)[questionSet objectAtIndex:index] answerChoice3]];
    [answerChoice4 setText:[(Question *)[questionSet objectAtIndex:index] answerChoice4]];
}

- (void)selectAns1
{
    [self updateSelectedAnswer:1];
}

- (void)selectAns2
{
    [self updateSelectedAnswer:2];
}

- (void)selectAns3
{
    [self updateSelectedAnswer:3];
}

- (void)selectAns4
{
    [self updateSelectedAnswer:4];
}

/*
 * Update color on the answer choice
 */
- (void)updateSelectedAnswer:(int)selectedAnswer
{
    if (currentSelectedAnswer != -1) { // If an answer is selected, unmark that answer
        [self unmarkAnswer];
    }
    
    // User clicks on the answer that is already selected => deselect the answer
    // Set currentSelectedAnswer to -1
    if (currentSelectedAnswer == selectedAnswer) {
        currentSelectedAnswer = -1;
        //userAnswer[current] = -1;
        [[ad userAnswers] replaceObjectAtIndex:current withObject:[NSNumber numberWithInt:-1]];
    } else {
        currentSelectedAnswer = selectedAnswer;
        [self markAnswer];
        //userAnswer[current] = selectedAnswer;
        [[ad userAnswers] replaceObjectAtIndex:current withObject:[NSNumber numberWithInt:selectedAnswer]];
    }
}

/*
 * When user hits 'Next'
 */
- (IBAction)next:(id)sender
{
    if (current < [questionSet count] - 1) {
        if (current == 0) { // If user is moving to question 2, show the back button
            [previous setHidden:NO];
        }
        // Unmark the 'old' current answer
        if (currentSelectedAnswer != -1) {
            [self unmarkAnswer];
        }
    
        // Update current value
        current++;
        
        // Update question and answer content
        [self updateContentOfLabels:current];
        
        // Update user answer
        //currentSelectedAnswer = userAnswer[current];
        currentSelectedAnswer = [(NSNumber *)[[ad userAnswers] objectAtIndex:current] intValue];
        // Mark the updated answer
        if (currentSelectedAnswer != -1) {
            [self markAnswer];
        }
    } else if (current == [questionSet count] - 1) { // At the last question => Proceed to feedback view
        if ([self allQuestionsAreAnswered]) {
            [warningMessage setText:@""];
            FeedbackView *fbv = [[FeedbackView alloc] init];
            
            [self.navigationController pushViewController:fbv animated:YES];
        } else {
            [warningMessage setText:@"Oops! You need to answer all questions in order to continue :)"];
        }
    }
    NSLog(@"Current answer: %d", currentSelectedAnswer);
}

/*
 * When user hits 'Back'
 */

- (IBAction)previous:(id)sender
{
    // Go back to previous set. If it is the first set, go to InstructionView
    if (current == 1) {
        [previous setHidden:YES];
    }
    
    // At the last question, set warning message to blank
    if (current == 4) {
        [warningMessage setText:@""];
    }
        
    // Unmark the 'old' current answer (if any)
    if (currentSelectedAnswer != -1) {
        [self unmarkAnswer];
    }

    // Update current value
    current--;
        
    // Update question and answer content
    [self updateContentOfLabels:current];
        
    // Update user answer
    //currentSelectedAnswer = userAnswer[current];
    currentSelectedAnswer = [(NSNumber *)[[ad userAnswers] objectAtIndex:current] intValue];
    // Mark the updated answer
    if (currentSelectedAnswer != -1) {
        [self markAnswer];
    }
}

/*
 * Mark the current answer. Background color is set to brown.
 */
- (void)markAnswer
{
    [[answerLabels objectAtIndex:currentSelectedAnswer - 1] setBackgroundColor:aSelectedColor];
}

/*
 * Unmark the current answer. Background color is set to green.
 */
- (void)unmarkAnswer
{
    [[answerLabels objectAtIndex:currentSelectedAnswer - 1] setBackgroundColor:aColor];
}

/*
 * Check if user has answered all the questions
 */
- (BOOL)allQuestionsAreAnswered
{
    for (int i = 0; i < 5; i++) {
        if ([(NSNumber *)[[ad userAnswers] objectAtIndex:i] intValue] == -1) {
            return false;
        }
        
        //if (userAnswer[i] == -1) { // -1 means user has not selected an answer
        //    return false;
        //}
    }
    return true; // None of the question is unanswered
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
