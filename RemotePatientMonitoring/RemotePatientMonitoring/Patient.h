//
//  Patient.h
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 12/11/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

/*
 * Patient data structures
 */
#import <Foundation/Foundation.h>

@interface Patient : NSObject

@property int identification;
@property NSString *lastName;
@property NSString *firstName;
@property int heightInInches;
@property int weightInPounds;

- (id)initWithID:(int)newID lastName:(NSString *)last firstName:(NSString *)first weightInInches:(int)weight heightInPounds:(int)height;

@end
