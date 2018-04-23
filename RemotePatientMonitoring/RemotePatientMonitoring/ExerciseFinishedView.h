//
//  ExercisesView.h
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 11/4/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SurveyView.h"
#import "Config.h"

@interface ExerciseFinishedView : UIViewController
{
    int bodyY, bodyH;
    int dist;
}

@property (strong, nonatomic) UIView *mainView;
@property (strong, nonatomic) UIImageView *background;
@property (strong, nonatomic) UIView *titleBackground;
@property (strong, nonatomic) UIView *bodyBackground;

@property (strong ,nonatomic) UILabel *instructionText;
@property (strong, nonatomic) UIButton *next;

@end
