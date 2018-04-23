//
//  MainScreen.h
//  AlarmProject
//
//  Created by Dat Phan on 5/15/14.
//  Copyright (c) 2014 Dat Phan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "UIAlarmClock.h"
#import "ArrowUp.h"

@interface MainScreen : UIViewController
{
    int hour, sHour, minute, sMinute;
    bool wakeNow;
    NSMutableArray *starCollection;
}

@property (strong, nonatomic) NSTimer *timerHour;
@property (strong, nonatomic) NSTimer *timerMinute;

@property (strong, nonatomic) UIAlarmClock *alarmView;
@property (strong, nonatomic, retain) AVAudioPlayer *player;

@property (strong, nonatomic) UILabel *sysHour;
@property (strong, nonatomic) UILabel *sysColon;
@property (strong, nonatomic) UILabel *sysMinute;

@property (strong, nonatomic) UILabel *alarmHour;
@property (strong, nonatomic) UILabel *alarmColon;
@property (strong, nonatomic) UILabel *alarmMinute;

@end
