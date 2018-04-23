//
//  PatientInfoView.h
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 11/19/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Config.h"
#import "ConnectDeviceView.h"
#import "Patient.h"

@interface PatientInfoView : UIViewController
{
    int bodyY, bodyH;
    int offset;
    int distA;
    int distB;
}

@property (strong, nonatomic) UIView *mainView;
@property (strong, nonatomic) UIImageView *background;

@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) UIView *titleBackground;

@property (strong, nonatomic) UILabel *idIndicator; // Label with word "ID"
@property (strong, nonatomic) UILabel *nameIndicator; // "Name"
@property (strong, nonatomic) UILabel *weightIndicator; // "Weight"
@property (strong, nonatomic) UILabel *heightIndicator; // "Height"

@property (strong, nonatomic) UILabel *patientID; // to show the patient's identification number
@property (strong, nonatomic) UILabel *patientName; // to show the patient's name
@property (strong, nonatomic) UILabel *patientWeight; // to show the patient's weight
@property (strong, nonatomic) UILabel *patientHeight; // to show the patient's height

@property (strong, nonatomic) UILabel *weightUnit; // show the unit of weight (kg, pound, etc)
@property (strong, nonatomic) UILabel *heightUnit; // show the unit of height (inch, centimeter, etc)

@property (strong, nonatomic) UIView *bodyBackground;

@property (strong, nonatomic) UIButton *startSession; // Start button
@property (strong, nonatomic) UIButton *signOut; // Log-out button

@property int identification;
@property Patient *patient;

@end
