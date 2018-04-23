//
//  MainScreen.m
//  AlarmProject
//
//  Created by Dat Phan on 5/15/14.
//  Copyright (c) 2014 Dat Phan. All rights reserved.
//

#import "MainScreen.h"
#import "UIConfig.h"
#import "MiscConfig.h"
#import "Star.h"
#import "MathUtility.h"

@interface MainScreen ()

@end

@implementation MainScreen

@synthesize timerHour, timerMinute, player;
@synthesize sysHour, sysColon, sysMinute;
@synthesize alarmHour, alarmColon, alarmMinute;

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
    
    hour = 7;
    minute = 2;
    wakeNow = true;
    starCollection = [[NSMutableArray alloc] init];
    
    [self setupUI];
    [self setupSound];
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(updateCurrentTime) userInfo:nil repeats:YES];
    [self moveTheUniverse:starCollection];
}

/*
    Initialize UI elements (position, text color, font size,...)
    Add recognizers to detect tap events
*/
- (void)setupUI
{
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIConfig getScreenW], [UIConfig getScreenH])];
    [backgroundView setBackgroundColor:[UIConfig getScreenBGColor]];
    
    sysHour = [[UILabel alloc] initWithFrame:CGRectMake(210, 20, [UIConfig getSClockWidth], [UIConfig getSClockHeight])];
    [sysHour setFont:[UIConfig getSysClockFont]];
    [sysHour setTextAlignment:1];
    [sysHour setTextColor:[UIConfig getSysClockColor]];
    [sysHour setText:[self getDisplayedTime:hour]];
    [sysHour setUserInteractionEnabled:YES];
    
    sysColon = [[UILabel alloc] initWithFrame:CGRectMake(240, 20, [UIConfig getSClockWidth], [UIConfig getSClockHeight])];
    [sysColon setFont:[UIConfig getSysClockFont]];
    [sysColon setTextAlignment:1];
    [sysColon setTextColor:[UIConfig getSysClockColor]];
    [sysColon setText:@":"];
    
    sysMinute = [[UILabel alloc] initWithFrame:CGRectMake(270, 20, [UIConfig getSClockWidth], [UIConfig getSClockHeight])];
    [sysMinute setFont:[UIConfig getSysClockFont]];
    [sysMinute setTextAlignment:1];
    [sysMinute setTextColor:[UIConfig getSysClockColor]];
    [sysMinute setText:[self getDisplayedTime:minute]];
    
    alarmHour = [[UILabel alloc] initWithFrame:CGRectMake(30, 65, [UIConfig getAClockWidth], [UIConfig getAClockHeight])];
    [alarmHour setFont:[UIConfig getAlarmClockFont]];
    [alarmHour setTextAlignment:1];
    [alarmHour setTextColor:[UIConfig getAlarmClockColor]];
    [alarmHour setText:[self getDisplayedTime:hour]];
    [alarmHour setUserInteractionEnabled:YES];
    
    alarmColon = [[UILabel alloc] initWithFrame:CGRectMake(105, 65, [UIConfig getAClockWidth], [UIConfig getAClockHeight])];
    [alarmColon setFont:[UIConfig getAlarmClockFont]];
    [alarmColon setTextAlignment:1];
    [alarmColon setTextColor:[UIConfig getAlarmClockColor]];
    [alarmColon setText:@":"];
    
    alarmMinute = [[UILabel alloc] initWithFrame:CGRectMake(180, 65, [UIConfig getAClockWidth], [UIConfig getAClockHeight])];
    [alarmMinute setFont:[UIConfig getAlarmClockFont]];
    [alarmMinute setTextAlignment:1];
    [alarmMinute setTextColor:[UIConfig getAlarmClockColor]];
    [alarmMinute setText:[self getDisplayedTime:minute]];
    [alarmMinute setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *rHour = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHour:)];
    UITapGestureRecognizer *rMinute = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMinute:)];
    
    UILongPressGestureRecognizer *lpHour = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(holdHour:)];
    UILongPressGestureRecognizer *lpMinute = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(holdMinute:)];
    [lpHour setMinimumPressDuration:[MiscConfig getMinimumPressDuration]];
    [lpMinute setMinimumPressDuration:[MiscConfig getMinimumPressDuration]];
    
    [alarmHour addGestureRecognizer:rHour];
    [alarmHour addGestureRecognizer:lpHour];
    [alarmMinute addGestureRecognizer:rMinute];
    [alarmMinute addGestureRecognizer:lpMinute];
    
    [self.view addSubview:backgroundView];
    
    for (int i = 0; i < 100; ++i) {
        Star *s = [[Star alloc] init];
        [s setFrame:CGRectMake([MathUtility getRandomFromMin:-500 max:500 decimals:5], [MathUtility getRandomFromMin:-1000 max:1000 decimals:5], 7, 7)];
        [s setupStarSmallDimBlue];
        [s setOpaque:NO];
        [s setNeedsDisplay];
        [starCollection addObject:s];
        [self.view addSubview:s];
    }
    
    for (int i = 0; i < 100; ++i) {
        Star *s = [[Star alloc] init];
        [s setFrame:CGRectMake([MathUtility getRandomFromMin:-500 max:500 decimals:5], [MathUtility getRandomFromMin:-1000 max:1000 decimals:5], 7, 7)];
        [s setupStarSmallBrightBlue];
        [s setOpaque:NO];
        [s setNeedsDisplay];
        [starCollection addObject:s];
        [self.view addSubview:s];
    }
    
    for (int i = 0; i < 50; ++i) {
        Star *s = [[Star alloc] init];
        [s setFrame:CGRectMake([MathUtility getRandomFromMin:-500 max:500 decimals:5], [MathUtility getRandomFromMin:-1000 max:1000 decimals:5], 15, 15)];
        [s setupStarTwinkleOrange];
        [s setOpaque:NO];
        [s setNeedsDisplay];
        [starCollection addObject:s];
        [self.view addSubview:s];
    }
    
    [self.view addSubview:sysHour];
    [self.view addSubview:sysColon];
    [self.view addSubview:sysMinute];
    [self.view addSubview:alarmHour];
    [self.view addSubview:alarmColon];
    [self.view addSubview:alarmMinute];
    
    NSArray *a = [UIFont familyNames];
    for (int i = 0; i < [a count]; ++i) {
        NSLog(@"%@", [a objectAtIndex:i]);
    }
    
    for (int i = 0; i < 50; ++i)
    NSLog(@"%f", [MathUtility getRandomFromMin:-1000 max:11 decimals:5]);
}

- (void)setupSound
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"alarmsound" ofType:@"wav"];
    
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:filePath];
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    [player setNumberOfLoops:-1];
    [player prepareToPlay];
}

- (void)moveTheUniverse:(NSMutableArray *)universe
{
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(move) userInfo:nil repeats:YES];
}

- (void)move
{
    for (Star *s in starCollection) {
        CGPoint p = [s center];
        s.center = CGPointMake(p.x + 0.01, p.y + 0.01);
        
        [s setNeedsDisplay];
    }
}

- (void)updateCurrentTime
{
    @autoreleasepool {
        NSDate *currentDate = [NSDate date];
        NSString *stringHour = [self getHourFromDate:currentDate];
        NSString *stringMinute = [self getMinuteFromDate:currentDate];
        
        sHour = [stringHour intValue];
        sMinute = [stringMinute intValue];
        
        [sysHour setText:[self getHourFromDate:currentDate]];
        [sysMinute setText:[self getMinuteFromDate:currentDate]];
        
        if (wakeNow && sHour == hour && sMinute == minute) {
            // Time to wake up!
            wakeNow = false;
            [self triggerAlarm];
        }
    }
}

/*
    Call animation/sound methods
    Update/reset variables
 */
- (void)triggerAlarm
{
    [player play];
}

/*
    Stop alarm
 */
- (void)snooze
{
    wakeNow = false;
    [player stop];
}

- (void)swipeHour
{
    NSLog(@"swipe sucess!");
    hour++;
    if (hour >= 24) hour = 0;
    [self refreshUIHour];
}

/*
    Handles increment tap for HOUR
 */
- (void)tapHour:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded) {
        hour++;
        if (hour >= 24) hour = 0;
        [self refreshUIHour];
    }

}

/*
    Handles tap increment for MINUTE
 */
- (void)tapMinute:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded) {
        minute++;
        if (minute >= 60) minute = 0;
        [self refreshUIMinute];
    }
}

- (void)holdHour:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Began");
        timerHour = [NSTimer scheduledTimerWithTimeInterval:[MiscConfig getSpeed] target:self selector:@selector(decreaseHour) userInfo:nil repeats:YES];
    }
    if (sender.state == UIGestureRecognizerStateCancelled) {
        NSLog(@"Cancelled");
        [timerHour invalidate];
    }
    if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"Ended");
        [timerHour invalidate];
    }
}

- (void)holdMinute:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Began");
        timerMinute = [NSTimer scheduledTimerWithTimeInterval:[MiscConfig getSpeed] target:self selector:@selector(decreaseMinute) userInfo:nil repeats:YES];
    }
    if (sender.state == UIGestureRecognizerStateCancelled) {
        NSLog(@"Cancelled");
        [timerMinute invalidate];
    }
    if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"Ended");
        [timerMinute invalidate];
    }
}

- (void)decreaseHour
{
    hour--;
    if (hour < 0) hour = 23;
    [self refreshUIHour];
}

- (void)decreaseMinute
{
    minute--;
    if (minute < 0) minute = 59;
    [self refreshUIMinute];
}

/*
    Redisplay HOUR label
 */
- (void)refreshUIHour
{
    [alarmHour setText:[self getDisplayedTime:hour]];
}

/*
    Redisplay MINUTE label
 */
- (void)refreshUIMinute
{
    [alarmMinute setText:[self getDisplayedTime:minute]];
}

/*
    Convert time from integer type to NSString type
    Single digit has a preceding 0. For example: 4 is displayed as 04
 */
- (NSString *)getDisplayedTime:(int)t
{
    NSString *s;
    if (t >= 10) s = [NSString stringWithFormat:@"%d", t];
    else s = [NSString stringWithFormat:@"0%d", t];
    return s;
}

/*
    Get string representation of HOUR from a date object
    Update sHour
 */
- (NSString *)getHourFromDate:(NSDate *)date
{
    NSString *result = @"Error";
    if (date != nil) {
        NSString *s = [date description];
        result = [NSString stringWithFormat:@"%c%c", [s characterAtIndex:11], [s characterAtIndex:12]];
    }
    
    return result;
}

/*
    Get string representation of MINUTE from a date object
    Update sMinute
 */
- (NSString *)getMinuteFromDate:(NSDate *)date
{
    NSString *result = @"Error";
    if (date != nil) {
        NSString *s = [date description];
        result = [NSString stringWithFormat:@"%c%c", [s characterAtIndex:14], [s characterAtIndex:15]];
    }
    return result;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
