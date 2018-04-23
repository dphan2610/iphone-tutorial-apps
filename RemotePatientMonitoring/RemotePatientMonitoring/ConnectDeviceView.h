//
//  ConnectDeviceView.h
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 11/19/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SessionView.h"
#import <CoreBluetooth/CoreBluetooth.h>

@class AppDelegate; // Prefer using class from import

@interface ConnectDeviceView : UIViewController
{
    int bodyY, bodyH, dist;
}

@property (strong, nonatomic) UIView *mainView;
@property (strong, nonatomic) UIView *background;

@property (strong, nonatomic) UIView *titleBackground;

@property (strong, nonatomic) UILabel *instruction;
@property (strong, nonatomic) UILabel *message;

@property (strong, nonatomic) UIButton *connect;
@property (strong, nonatomic) UIButton *previous;
@property (strong, nonatomic) UIButton *next;

@property (strong, nonatomic) UIImage *succeedImg; // Point to checkmark.png
@property (strong, nonatomic) UIImage *failImg; // Point to xmark.png

@property (strong, nonatomic) UIImageView *status;

@property (strong, nonatomic) UIView *bodyBackground;

/* CoreBluetooth stuff */
@property CBCentralManager *myCentralManager; // Represent the central manager (iPhone or computer)
@property CBPeripheral *myPeripheral; // Represent the heart rate device
@property CBService *myService; // Represent service
@property CBCharacteristic *myCharacteristic;


@property AppDelegate *ad;

@end
