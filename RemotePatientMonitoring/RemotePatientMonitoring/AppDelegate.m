//
//  AppDelegate.m
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 11/4/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

/*
 * +++++++++++++++++ WARNING: +++++++++++++++++++++++
 *      Remote Monitoring app is inteneded for real device use only, and it will not function correctly on simulator.
 *
 */
#import "AppDelegate.h"

@implementation AppDelegate

@synthesize userAnswers, userFeedback;
@synthesize disconnected;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [Config initColorTheme];
    
    userAnswers = [[NSMutableArray alloc] initWithCapacity:5]; // hold answers to 5 multiple questions
    
    
    // Initialize answers to -1
    for (int i = 0; i < 5; i++) {
        [userAnswers insertObject:[NSNumber numberWithInt:-1] atIndex:i];
    }
    userFeedback = [[NSMutableString alloc] init];
    PatientInfoView *root = [[PatientInfoView alloc] init];
    
    UINavigationController *navVC = [[UINavigationController alloc] init];
    [navVC setNavigationBarHidden:YES]; // Hide the navigation bar
    [navVC setViewControllers:[NSArray arrayWithObject:root]];
    
    [self.window setRootViewController:navVC];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
