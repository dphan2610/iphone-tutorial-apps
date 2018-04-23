//
//  ViewController.h
//  KillTheRoaches
//
//  Created by Dat Phan on 4/23/18.
//  Copyright © 2018 Dat Phan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeView : UIViewController
{
    int num_of_roach;
    int x;
    int y;
}
@property UIImageView *theme;
@property UIImageView *cockroach;
@property UIImageView *boom;
@property UILabel *score;
@property UILabel *scoretext;

@end

