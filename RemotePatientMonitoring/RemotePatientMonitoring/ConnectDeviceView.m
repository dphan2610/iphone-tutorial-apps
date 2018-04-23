//
//  ConnectDeviceView.m
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 11/19/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import "ConnectDeviceView.h"
#import "AppDelegate.h"

@interface ConnectDeviceView ()

@end

@implementation ConnectDeviceView

@synthesize mainView, background, titleBackground, bodyBackground, instruction, message, connect, previous, next, succeedImg, failImg, status;
@synthesize myCentralManager, myPeripheral, myService, myCharacteristic;
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
    bodyY = 100;
    bodyH = 100;
    dist = 5;
    
    ad = [[UIApplication sharedApplication] delegate]; // A way to get variables or objects from AppDelegate
    
    myCentralManager = [[CBCentralManager alloc] initWithDelegate:(id)self queue:nil]; // Initialize central manager
    //myCentralManager = [[CBCentralManager alloc] init]; // Initialize central manager
    
    [self setupInterface];
    succeedImg = [UIImage imageNamed:@"checkmark.png"];
    failImg = [UIImage imageNamed:@"xmark.png"];
    
    status = [[UIImageView alloc] initWithFrame:CGRectMake(15, 250, 50, 50)];
    
    [mainView addSubview:status];
}

- (void)setupInterface
{
    mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 570)];
    [self.view addSubview:mainView];
    
    background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 570)];
    [background setBackgroundColor:[Config getBackgroundColor]];
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
    
    bodyBackground = [[UIView alloc] initWithFrame:CGRectMake(0, bodyY, 320, bodyH)];
    [bodyBackground setBackgroundColor:[Config getBodyBackgroundColor]];
    [self.view addSubview:bodyBackground];
    
    instruction = [[UILabel alloc] initWithFrame:CGRectMake(15, 100, 280, 60)];
    //[instruction setBackgroundColor:[[UIColor alloc] initWithRed:224/255.0 green:228/255.0 blue:250/255.0 alpha:1]];
    instruction.numberOfLines = 2;
    [instruction setFont:[Config getTextFont]];
    [instruction setText:@"Please put the sensor around your chest, then hit"];
    [self.view addSubview:instruction];
    
    message = [[UILabel alloc] initWithFrame:CGRectMake(80, 245, 200, 60)];
    [message setTextAlignment:0];
    message.numberOfLines = 2;
    [message setFont:[Config getTextFont]];
    [self.view addSubview:message];
    
    UIFont *fontButton = [UIFont fontWithName:@"Arial" size:20];
    
    connect = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [connect setFrame:CGRectMake(125, 122, 90, 40)];
    [connect setTitle:@"Connect" forState:UIControlStateNormal];
    [[connect titleLabel] setFont:fontButton];
    [connect setTitleColor:[Config getLinkTextColor] forState:UIControlStateNormal];
    [connect setTitleColor:[UIColor darkGrayColor] forState:UIControlStateDisabled];
    [connect addTarget:self action:@selector(connect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:connect];
    
    
    
    previous = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [previous setFrame:CGRectMake(10, bodyY + bodyH + dist, 90, 40)];
    [previous setTitle:@"Back" forState:UIControlStateNormal];
    [[previous titleLabel] setFont:fontButton];
    [previous setTitleColor:[Config getLinkTextColor] forState:UIControlStateNormal];
    [previous addTarget:self action:@selector(previous:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:previous];

    next = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [next setFrame:CGRectMake(210, bodyY + bodyH + dist, 90, 40)];
    [next setTitle:@"Next" forState:UIControlStateNormal];
    [[next titleLabel] setFont:fontButton];
    [next setBackgroundColor:[Config getButtonDisabledBgColor]];
    [[next layer] setMasksToBounds:YES];
    [[next layer] setCornerRadius:9.0f];
    [next setTitleColor:[Config getButtonTextColor] forState:UIControlStateNormal];
    [next setTitleColor:[Config getButtonTextDisabledColor] forState:UIControlStateDisabled];
    [next addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    [next setEnabled:NO];
    [self.view addSubview:next];

}

/*
 * Update UI if successfully connected
 */
- (void)updateUIConnectionSuccess
{
    [status setImage:succeedImg];
    [message setText:@"Sensor connected!\nHit Next to continue."];
    [message setTextColor:[UIColor colorWithRed:50/255.0 green:205/255.0 blue:50/255.0 alpha:1]];
    [connect setEnabled:NO];
    [next setEnabled:YES];
    [next setBackgroundColor:[Config getLightYellow]];
}

/*
 * Update UI if failed to connect
 */
- (void)updateUIConnectionFailure
{
    [status setImage:failImg];
    [message setText:@"Connection failure :(\nPlease try again."];
    [message setTextColor:[UIColor redColor]];
    [connect setEnabled:YES];
    [next setEnabled:NO];
    [next setBackgroundColor:[Config getButtonDisabledBgColor]];
}

- (void)updateUIWaiting
{
    [connect setEnabled:NO];
    [status setImage:nil];
    [message setText:@"Connecting your device. Please wait..."];
    [message setTextColor:[UIColor whiteColor]];
    
}

/*
 * In this method, we call scanForPeripheralsWithServices from central manager object
 */
- (IBAction)connect:(id)sender
{
    [self updateUIWaiting];
    [myCentralManager stopScan]; // stop scanning before doing another scanning

    // Only scan for devices that advertise Heart Rate Service (UUID is 180D)
    [myCentralManager scanForPeripheralsWithServices:[NSArray arrayWithObject:[CBUUID UUIDWithString:@"180D"]] options:nil]; // will call didDiscoverPeripheral method if the sensor is discovered

}

- (IBAction)next:(id)sender
{
    SessionView *sessionView = [[SessionView alloc] init];
    sessionView.myCentralManager = myCentralManager;
    sessionView.myPeripheral = myPeripheral;
    sessionView.myCharacteristic = myCharacteristic;
    [self.navigationController pushViewController:sessionView animated:YES];
}

/*
 * This is where we:
 *      - stop scanning for peripheral
 *      - disconnect the device
 *
 */
- (IBAction)previous:(id)sender
{
    [myCentralManager stopScan];
    
    ad.disconnected = TRUE;
    [self.navigationController popViewControllerAnimated:NO];
}

/*
 * Required method
 */
- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    NSLog(@"Changed state in central manager!");
}

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    NSLog(@"Changed state in PERIPHERAL!");
}

- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error
{
    NSLog(@"Failed to connect to the sensor.");
}

/*
 * Handling event when the sensor is disconnected
 */
- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error
{
    ad.disconnected = TRUE;
    NSLog(@"Peripheral DISCONNECTED!!!!!!!! in connectdeviceview");
    [self updateUIConnectionFailure];
    
}

/*
 * When the app has just discovered the device
 *
 * (goes to ConnectDeviceView.m in RPM project)
 */
- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    [myCentralManager stopScan]; // Stop scanning to save power
    NSLog(@"Discovered %@", peripheral.name); // Print out the device name
    
    myPeripheral = peripheral;
    myPeripheral.delegate = self; // to ensure it receives appropriate callbacks
    
    [myCentralManager connectPeripheral:myPeripheral options:nil]; // Connect to the device
    
}

- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral
{
    ad.disconnected = FALSE;
    NSLog(@"Peripheral connected");
    [myPeripheral discoverServices:nil];
}

/*
 * Discovered some services
 *
 * (goes to ConnectDeviceView.m in RPM project)
 */
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error
{
    for (CBService *service in peripheral.services) {
        NSLog(@"Discovered service %@", service);
        myService = service;
        
        /*
         * Search for characteristics of Heart Rate Service ONLY
         * When the app discovers one or more characteristics, it calls the method
         * didDiscoverCharacteristicsForService
         */
        if ([myService.UUID isEqual:[CBUUID UUIDWithString:@"180D"]]) { // Heart Rate Service
            [myPeripheral discoverCharacteristics:nil forService:myService];
        }
    }
}

/*
 * Discovered some characteristics of a service
 *
 * (goes to ConnectDeviceView.m)
 */
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error
{
    for (CBCharacteristic *characteristic in service.characteristics) {
        NSLog(@"Discovered characteristic %@", characteristic);
        //[myPeripheral readValueForCharacteristic:characteristic];
        
        // Subscribing only to heart rate measurement characteristic
        if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:@"2A37"]]) {
            myCharacteristic = characteristic;
            NSLog(@"It's PARTY TIME!!!");
        }
    }
    
    
    
    [self updateUIConnectionSuccess]; // Successful connection :)
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
}

@end
