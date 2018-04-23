//
//  Survey.h
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 11/4/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Config.h"
#import "Question.h"
#import "FeedbackView.h"

@class AppDelegate;

@interface SurveyView : UIViewController
{
    int current; // current question
    
    // The answer choice (-1, 1, 2, 3, or 4) that is currently selected
    // -1: no choice is selected
    int currentSelectedAnswer;
    int offset;
    //int userAnswer[5]; // user answer choices. Example: userAnswer[0] = 3 means user selected choice 3 for question 1
}

@property (strong, nonatomic) UIView *mainView;
@property (strong, nonatomic) UIImageView *background;
@property (strong, nonatomic) UIView *titleBackground;

@property (strong, nonatomic) UILabel *question;

@property (strong, nonatomic) UILabel *answerChoice1;
@property (strong, nonatomic) UILabel *answerChoice2;
@property (strong, nonatomic) UILabel *answerChoice3;
@property (strong, nonatomic) UILabel *answerChoice4;

@property (strong, nonatomic) UILabel *warningMessage; // used to display warning message when user attempts to hit next at the last question without answering all the questions

@property (strong, nonatomic) UIButton *next;
@property (strong, nonatomic) UIButton *previous;

@property (strong, nonatomic) NSArray *questionSet;
@property (strong, nonatomic) NSArray *answerLabels;

@property UIColor *qColor; // question background color
@property UIColor *aColor; // answer background color
@property UIColor *aSelectedColor; // answer background color when selected


@property AppDelegate *ad; // We need this to get the array userAnswers

@end
