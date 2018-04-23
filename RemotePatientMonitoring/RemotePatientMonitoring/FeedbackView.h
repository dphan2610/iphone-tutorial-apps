//
//  FeedbackView.h
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 12/3/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SurveyView.h"

@class AppDelegate; // Need this line to declare an AppDelegate property

@interface FeedbackView : UIViewController
{
    int userAnswer[5];
    
    int offset;
}

@property (strong, nonatomic) UIView *mainView;
@property (strong, nonatomic) UIImageView *background;
@property (strong, nonatomic) UIView *titleBackground;

@property (strong, nonatomic) UILabel *instruction;
@property (strong, nonatomic) UITextView *userInput; // UITextView allows multilines text

@property (strong, nonatomic) UIButton *previous;
@property (strong, nonatomic) UIButton *doneEditing;
@property (strong, nonatomic) UIButton *submit;


@property (strong, nonatomic) UILabel *message;
@property (strong, nonatomic) UIButton *home;

@property AppDelegate *ad;

@end
