//
//  Patient.m
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 12/11/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import "Patient.h"

@implementation Patient

- (id)initWithID:(int)newID lastName:(NSString *)last firstName:(NSString *)first weightInInches:(int)weight heightInPounds:(int)height
{
    if (self = [super init]) {
        self.identification = newID;
        self.lastName = last;
        self.firstName = first;
        self.weightInPounds = weight;
        self.heightInInches = height;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%d: %@, %@, %d, %d", self.identification, self.lastName, self.firstName, self.weightInPounds, self.heightInInches];
}

@end
