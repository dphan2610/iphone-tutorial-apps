//
//  HeartRateRecord.h
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 12/7/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

/* 
 * Simple heart rate data structure
 */

#import <Foundation/Foundation.h>

@interface HeartRateRecord : NSObject

@property double timeStamp; // Unix time
@property int heartRate; // Heart rate

@end
