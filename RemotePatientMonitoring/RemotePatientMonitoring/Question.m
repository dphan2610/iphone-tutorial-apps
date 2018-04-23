//
//  Question.m
//  RemotePatientMonitoring
//
//  Created by Dat Phan on 11/14/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import "Question.h"

@interface Question ()

@end

@implementation Question

//@synthesize question, answerChoice1, answerChoice2, answerChoice3, answerChoice4;
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/
- (id)initWithQuestion:(NSString *)q choice1:(NSString *)c1 choice2:(NSString *)c2 choice3:(NSString *)c3 choice4:(NSString *)c4
{
    if (self = [super init]) {
        self.question = q;
        self.answerChoice1 = c1;
        self.answerChoice2 = c2;
        self.answerChoice3 = c3;
        self.answerChoice4 = c4;
    }
    return self;
}
/*
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/
@end
