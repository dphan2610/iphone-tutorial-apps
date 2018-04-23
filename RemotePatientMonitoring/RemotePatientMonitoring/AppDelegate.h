//
//  AppDelegate.h
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 11/4/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Config.h"
#import "PatientInfoView.h"
#import "SessionView.h"
#import "ExerciseFinishedView.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSMutableArray *userAnswers; // Array to keep track of answers
@property (strong, nonatomic) NSMutableString *userFeedback;

@property BOOL disconnected;

@end
