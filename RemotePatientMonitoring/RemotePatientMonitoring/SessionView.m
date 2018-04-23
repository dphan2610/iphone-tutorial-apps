//
//  SessionView.m
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 11/23/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import "SessionView.h"
#import "AppDelegate.h"

@interface SessionView ()

@end

@implementation SessionView

@synthesize mainView, background, titleBackground, bodyBackground1, bodyBackground2, instruction, begin, heartRateIndicator, imageHeart, heartRateLabel, heart, finishIndicator, previous, finish;
@synthesize tempData;
@synthesize myCentralManager, myPeripheral, myCharacteristic;
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
    body1Y = 100, body1H = 100;
    body2Y = 370, body2H = 50;
    
    ad = [[UIApplication sharedApplication] delegate]; // A way to get variables or objects from AppDelegate
    
    tempData = [[NSMutableArray alloc] init]; // Initialize temporary array
    
    myPeripheral.delegate = self; // to ensure appropriate callbacks
    
    [self setupInterface];
    
}

/*
 * Initialize UI components. They include:
 *      instruction/heart rate/indicators labels, begin/finish buttons, and heart image
 */
- (void)setupInterface
{
    mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 570)];
    [mainView setBackgroundColor:[UIColor lightTextColor]];
    [self.view addSubview:mainView];
    
    background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 570)];
    [background setBackgroundColor:[Config getBackgroundColor]];
    //[background setImage:[UIImage imageNamed:@"green-gradient.png"]];
    [mainView addSubview:background];
    
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
    
    bodyBackground1 = [[UIView alloc] initWithFrame:CGRectMake(0, body1Y, 320, body1H)];
    [bodyBackground1 setBackgroundColor:[Config getBodyBackgroundColor]];
    [self.view addSubview:bodyBackground1];
    
    instruction = [[UILabel alloc] initWithFrame:CGRectMake(15, 100, 280, 80)];
    //[instruction setBackgroundColor:[UIColor lightGrayColor]];
    instruction.numberOfLines = 3;
    [instruction setText:@"After you hit             your sensor will start collecting data, and you may begin your exercises."];
    [instruction setFont:[Config getTextFont]];
    [self.view addSubview:instruction];
    
    UIFont *fontButton = [UIFont fontWithName:@"Arial" size:20];
    
    begin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [begin setFrame:CGRectMake(100, 100, 90, 40)];
    [begin setTitle:@"Begin" forState:UIControlStateNormal];
    [[begin titleLabel] setFont:fontButton];
    [begin setTitleColor:[Config getLinkTextColor] forState:UIControlStateNormal];
    [begin addTarget:self action:@selector(begin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:begin];
    
    heartRateIndicator = [[UILabel alloc] initWithFrame:CGRectMake(15, 215, 180, 30)];
    //[heartRateIndicator setBackgroundColor:[UIColor lightGrayColor]];
    [heartRateIndicator setText:@"Your current heart rate:"];
    [heartRateIndicator setTextColor:[UIColor whiteColor]];
    [self.view addSubview:heartRateIndicator];
    
    heartRateLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 240, 65, 50)];
    //[heartRate setBackgroundColor:[UIColor lightGrayColor]];
    [heartRateLabel setTextAlignment:2];
    [heartRateLabel setFont:[UIFont systemFontOfSize:36]];
    [heartRateLabel setText:@"62"];
    [heartRateLabel setTextColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:224/255.0 alpha:1]];
    [self.view addSubview:heartRateLabel];
    
    // Images for animation
    imageHeart = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"heart1.gif"], [UIImage imageNamed:@"heart2.gif"], [UIImage imageNamed:@"heart3.gif"], [UIImage imageNamed:@"heart4.gif"], [UIImage imageNamed:@"heart5.gif"], [UIImage imageNamed:@"heart4.gif"], [UIImage imageNamed:@"heart3.gif"], [UIImage imageNamed:@"heart2.gif"], [UIImage imageNamed:@"heart1.gif"], nil];
    
    heart = [[UIImageView alloc] initWithImage:[imageHeart objectAtIndex:0]];
    [heart setFrame:CGRectMake(170, 240, 50, 50)];
    heart.animationImages = imageHeart; // Set animation images
    [self.view addSubview:heart];
    
    bodyBackground2 = [[UIView alloc] initWithFrame:CGRectMake(0, body2Y, 320, body2H)];
    [bodyBackground2 setBackgroundColor:[Config getBodyBackgroundColor]];
    [self.view addSubview:bodyBackground2];
    
    finishIndicator = [[UILabel alloc] initWithFrame:CGRectMake(15, 380, 250, 30)];
    //[finishIndicator setBackgroundColor:[UIColor grayColor]];
    [finishIndicator setText:@"When you are done, hit"];
    [self.view addSubview:finishIndicator];
    
    previous = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [previous setFrame:CGRectMake(15, 430, 90, 40)];
    [previous setTitle:@"Back" forState:UIControlStateNormal];
    [[previous titleLabel] setFont:fontButton];
    [previous setTitleColor:[Config getLinkTextColor] forState:UIControlStateNormal];
    [previous addTarget:self action:@selector(previous:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:previous];
    
    finish = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [finish setFrame:CGRectMake(180, 375, 90, 40)];
    [finish setTitle:@"Finish" forState:UIControlStateNormal];
    [[finish titleLabel] setFont:fontButton];
    [finish setTitleColor:[Config getLinkTextColor] forState:UIControlStateNormal];
    [finish addTarget:self action:@selector(finish:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:finish];
}

/*
 * Handling event when the sensor is disconnected
 */
- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error
{
    ad.disconnected = TRUE;
    NSLog(@"Peripheral DISCONNECTED!!!!!!!! in sessionview");
}


/*
 * This is where we subscribe to the heart rate measurement (HRM) characteristic
 */
- (IBAction)begin:(id)sender
{
    // Subscribe to HRM characteristic
    if (!ad.disconnected) { // If connected
        [myPeripheral setNotifyValue:YES forCharacteristic:myCharacteristic];
    } else {
        NSLog(@"Your sensor is disconnected! Please connect again!");
    }
}

/*
 * This method is called every new notification. The following tasks are executed:
 *      Updating UI (changing heart rate value)
 *      Adding heart rate value and corresponding time to an array (mutable)
 *
 */
- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error
{
    NSData *data = characteristic.value;
    
    /*
     * Reference:
     *      https://developer.apple.com/library/mac/samplecode/HeartRateMonitor/Listings/HeartRateMonitor_HeartRateMonitorAppDelegate_m.html
     *      https://developer.bluetooth.org/gatt/characteristics/Pages/CharacteristicViewer.aspx?u=org.bluetooth.characteristic.heart_rate_measurement.xml
     */
    
    /* Updated value for heart rate measurement received */
    if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:@"2A37"]])
    {
        if ((characteristic.value) || !error )
        {
            const uint8_t *reportData = [data bytes]; // Get the report data
            uint16_t bpm = 0;
            
            if ((reportData[0] & 0x01) == 0) { // First bit is 0
                bpm = reportData[1]; // uint8
                
            } else { // First bit is 1
                bpm = CFSwapInt16LittleToHost(*(uint16_t *)(&reportData[1])); // uint16
                
            }
            
            heartRate = bpm;
            [heartRateLabel setText:[NSString stringWithFormat:@"%d", heartRate]];
            // Update heart animation
            // Little math involved
            [heart setAnimationDuration:((double)60 / (double)heartRate)];
            heart.animationRepeatCount = 3; // 1: heartRate = 60, 2: 120
            
            [heart startAnimating];
            
            HeartRateRecord *hrc = [[HeartRateRecord alloc] init];
            [hrc setTimeStamp:[[NSDate date] timeIntervalSince1970]]; // Set epoch time
            [hrc setHeartRate:heartRate]; // Set heart rate
            
            [tempData addObject:hrc]; // Add HeartRateRecord object to the temporary stored array
            
            /*
             * Insert to the database for every notification update
             * This is only for TESTING.
             */
            //NSString *string = [NSString stringWithFormat:@"http://127.0.0.1/UpdateData.php?timestamp=%f&&heart_rate=%d", [[NSDate date] timeIntervalSince1970], heartRate];
            //NSURL *url = [NSURL URLWithString:string];
            
            //NSData *urlData = [NSData dataWithContentsOfURL:url]; // Execute the URL
            
            NSLog(@"Heart rate: %d", heartRate); // Print out updated heart rate
            
        }
    } else {
        NSLog(@"Value: %@", data); // Print whatever this is
        
    }
}

/*
 * Go back to ConnectDeviceView
 *
 * If sensor is still connected:
 *      - unsubscribe to heart rate characteristic
 *      - Remove connection between sensor and iPhone/iPod touch
 */
- (IBAction)previous:(id)sender
{
    if (!ad.disconnected) { // iOS device is still connected to the sensor
        [myPeripheral setNotifyValue:NO forCharacteristic:myCharacteristic]; // unsubscribe to heart rate characteristic
        [myCentralManager cancelPeripheralConnection:myPeripheral]; // remove connection2
    }
    [self.navigationController popViewControllerAnimated:YES];
}

/*
 * This is where we:
 *      - unsubscribe to the HRM characteristic
 *      - disconnect the device
 *      - fetch data from the temp array to our database
 *
 * Then we move to ExerciseFinishedView
 */
- (IBAction)finish:(id)sender
{
    [myPeripheral setNotifyValue:NO forCharacteristic:myCharacteristic]; // unsubscribe to the characteristic
    [myCentralManager cancelPeripheralConnection:myPeripheral]; // disconnect the sensor
    [self insertHeartRateDataFromRecordList:tempData];
    ExerciseFinishedView *efv = [[ExerciseFinishedView alloc] init];
    [self.navigationController pushViewController:efv animated:YES];
}

/*
 * Insert from an array of HeartRateRecord objects into the patient's table
 */
- (void)insertHeartRateDataFromRecordList:(NSMutableArray *)list
{
    // Insert heart rate and epoch time from each element
    for (int i = 0; i < [tempData count]; i++) {
        NSString *string = [NSString stringWithFormat:@"http://www.remotepatientmonitoring.dreamhosters.com/FetchHeartRate.php?timestamp=%f&&heart_rate=%d", [[list objectAtIndex:i] timeStamp], [[list objectAtIndex:i] heartRate]];
        NSURL *url = [NSURL URLWithString:string];
        NSData *urlData = [NSData dataWithContentsOfURL:url]; // Execute the URL
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
