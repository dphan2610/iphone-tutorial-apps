//
//  SessionView.h
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 11/23/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ExerciseFinishedView.h"
#import "HeartRateRecord.h"
#import <CoreBluetooth/CoreBluetooth.h>

@class AppDelegate;

@interface SessionView : UIViewController
{
    int heartRate;
    int body1Y, body1H, body2Y, body2H;
}

@property (strong, nonatomic) UIView *mainView;
@property (strong, nonatomic) UIImageView *background;
@property (strong, nonatomic) UIView *titleBackground;

@property (strong, nonatomic) UILabel *instruction;
@property (strong, nonatomic) UILabel *heartRateLabel; // Label showing current heart rate
@property (strong, nonatomic) UILabel *heartRateIndicator;
@property (strong, nonatomic) UILabel *finishIndicator;

@property (strong, nonatomic) UIButton *begin; // begin button
@property (strong, nonatomic) UIButton *previous; // back button
@property (strong, nonatomic) UIButton *finish; // finish button

@property (strong, nonatomic) NSArray *imageHeart; // Array holding several heart images for animation
@property (strong, nonatomic) UIImageView *heart; // The image heart

@property (strong, nonatomic) UIView *bodyBackground1;
@property (strong, nonatomic) UIView *bodyBackground2;

@property NSMutableArray *tempData; // Store temporary data objects

@property CBCentralManager *myCentralManager;
@property CBPeripheral *myPeripheral;
@property CBCharacteristic *myCharacteristic;


@property AppDelegate *ad; // We need this to get the boolean property disconnected

@end
