//
//  Question.h
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 11/14/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Question : NSObject

@property NSString *question;

@property NSString *answerChoice1;
@property NSString *answerChoice2;
@property NSString *answerChoice3;
@property NSString *answerChoice4;

- (id)initWithQuestion:(NSString *)q choice1:(NSString *)c1 choice2:(NSString *)c2 choice3:(NSString *)c3 choice4:(NSString *)c4;

@end
