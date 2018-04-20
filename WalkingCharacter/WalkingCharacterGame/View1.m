//
//  View1.m
//  WalkingCharacterGame
//
//  Created by Dat Phan on 12/23/13.
//  Copyright (c) 2013 Dat Phan. All rights reserved.
//

#import "View1.h"

@interface View1 ()

@end

@implementation View1

@synthesize mainView, square, upButton, downButton, leftButton, rightButton, character, tree, house, enemy, imagesWalkingUp, imagesWalkingDown, imagesWalkingLeft, imagesWalkingRight;

@synthesize bricks;

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
    
    test = true;
    random = 0;
    // pixelSpeed:
    //      1: slow
    //      2: moderate
    //      3: fast
    //      4: very fast
    //      5: ultra fast
    //      6: dizzily fast
    //      7: crazily fast
    //      8: unbeatably fast
    //      9: no-commently fast
    //      10+: legendary
    //      50: you-see-8-enemy fast
    //      100: you-see-4-enemy fast
    //      1000: blinking fast
    //
    // Sets that work:
    //      [0.01, 0.01, 1, 2]      (qualified)
    //      [0.01, 0.01, 1, 3]      (qualified)
    //      [0.01, 0.01, 1, 4]
    //      [0.01, 0.01, 1, x]      (x > 4)
    //      [0.01, 0.01, 2, 1]
    //      [0.01, 0.01, 2, 3]
    //      [0.01, 0.01, 2, 4]
    //      [0.01, 0.01, 2, 5]
    //      [0.01, 0.01, 2, x]      (x > 5)
    //      [0.01, 0.01, 3, 1]
    //      [0.01, 0.01, 3, 2]      (qualified)
    //      [0.01, 0.01, 3, 4]
    //      [0.01, 0.01, 3, x]      (x > 4)
    //      [0.01, 0.01, q, x]      (q is different from x)
    
    //      [0.02, 0.01, 1, 2]
    //      [0.05, 0.05, 2, 3]      (but not as smoooth as 0.01)
    
    // Don't work:
    //      [0.01, 0.01, 1, 1]
    //      [0.01, 0.01, 2, 2]
    //      [0.01, 0.01, 3, 3]
    //      [0.01, 0.01, q, x]      (q = x)
    
    //      [0.01, 0.02, 1, 1]
    //      [0.01, 0.02, 1, 2]
    //      [0.01, 0.02, 1, 3]
    //      [0.01, 0.02, 1, x]      (x > 3)
    
    //      [0.02, 0.01, 3, 2]
    
    //      [0.02, 0.02, 1, x]      (x > 0)
    //      [0.02, 0.02, 2, x]      (x > 0)
    //      [0.02, 0.02, 3, x]      (x > 0)
    //      [0.02, 0.02, q, x]      (q > 0, x > 0)
    animateDurationCharacter = 0.01;
    animateDurationEnemy = 0.01;
    pixelSpeed = 2;
    objectPixelSpeed = 1;
    
    bricks = [[NSArray alloc] init];
    for (int i = 0; i < 10; ++i) {
        //sleep(1);
    }
    
    [NSThread detachNewThreadSelector:@selector(whatdoesthefoxsay) toTarget:self withObject:nil]; // Enemy thread
    
    isMovingUp = false;
    isMovingDown = false;
    isMovingLeft = false;
    isMovingRight = false;
    
    indexUp = 0;
    indexDown = 0;
    indexLeft = 0;
    indexRight = 0;
    
    x = 150;
    y = 260;
    
    centerX = x;
    centerY = y;
    
    xTree = 150;
    yTree = 160;
    
    xHouse = 220;
    yHouse = 170;
    
    xEnemy = 100;
    yEnemy = 100;
    
    mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 570)];
    [mainView setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:mainView];
    
    imagesWalkingUp = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"u2.png"], [UIImage imageNamed:@"u3.png"], [UIImage imageNamed:@"u4.png"], [UIImage imageNamed:@"u2.png"],  [UIImage imageNamed:@"u5.png"], [UIImage imageNamed:@"u6.png"], nil];
    
    imagesWalkingDown = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"d2.png"], [UIImage imageNamed:@"d3.png"], [UIImage imageNamed:@"d4.png"], [UIImage imageNamed:@"d2.png"],  [UIImage imageNamed:@"d5.png"], [UIImage imageNamed:@"d6.png"], nil];
    
    imagesWalkingLeft = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"l2.png"], [UIImage imageNamed:@"l3.png"], [UIImage imageNamed:@"l4.png"], [UIImage imageNamed:@"l2.png"],[UIImage imageNamed:@"l5.png"], [UIImage imageNamed:@"l6.png"], nil];
    
    imagesWalkingRight = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"r2.png"], [UIImage imageNamed:@"r3.png"], [UIImage imageNamed:@"r4.png"], [UIImage imageNamed:@"r2.png"], [UIImage imageNamed:@"r5.png"],[UIImage imageNamed:@"r6.png"], nil];
    
    tree = [[UIImageView alloc] initWithFrame:CGRectMake(xTree - 15, yTree - 25, 30, 50)];
    [tree setImage:[UIImage imageNamed:@"tree"]];
    [mainView addSubview:tree];
    
    house = [[UIImageView alloc] initWithFrame:CGRectMake(xHouse - 50, yHouse - 50, 100, 100)];
    [house setImage:[UIImage imageNamed:@"house"]];
    [mainView addSubview:house];
    
    character = [[UIImageView alloc] initWithFrame:CGRectMake(x - 15, y - 20, 30, 40)];
    [character setImage:[imagesWalkingDown objectAtIndex:0]];
    [mainView addSubview:character];
    
    upButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [upButton setFrame:CGRectMake(150, 320, 70, 30)];
    [upButton addTarget:self action:@selector(moveUp:) forControlEvents:UIControlEventTouchDown];
    [upButton addTarget:self action:@selector(moveUpCancel:) forControlEvents:UIControlEventTouchUpInside];
    [upButton addTarget:self action:@selector(moveUpCancel:) forControlEvents:UIControlEventTouchDragExit];
    
    [upButton setTitle:@"UP" forState:UIControlStateNormal];
    [mainView addSubview:upButton];
    
    downButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [downButton setFrame:CGRectMake(150, 380, 70, 30)];
    [downButton addTarget:self action:@selector(moveDown:) forControlEvents:UIControlEventTouchDown];
    [downButton addTarget:self action:@selector(moveDownCancel:) forControlEvents:UIControlEventTouchUpInside];
    [downButton addTarget:self action:@selector(moveDownCancel:) forControlEvents:UIControlEventTouchDragExit];
    
    [downButton setTitle:@"DOWN" forState:UIControlStateNormal];
    [mainView addSubview:downButton];
    
    leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [leftButton setFrame:CGRectMake(80, 350, 70, 30)];
    [leftButton addTarget:self action:@selector(moveLeft:) forControlEvents:UIControlEventTouchDown];
    [leftButton addTarget:self action:@selector(moveLeftCancel:) forControlEvents:UIControlEventTouchUpInside];
    [leftButton addTarget:self action:@selector(moveLeftCancel:) forControlEvents:UIControlEventTouchDragExit];
    
    [leftButton setTitle:@"LEFT" forState:UIControlStateNormal];
    [mainView addSubview:leftButton];
    
    rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [rightButton setFrame:CGRectMake(220, 350, 70, 30)];
    [rightButton addTarget:self action:@selector(moveRight:) forControlEvents:UIControlEventTouchDown];
    [rightButton addTarget:self action:@selector(moveRightCancel:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton addTarget:self action:@selector(moveRightCancel:) forControlEvents:UIControlEventTouchDragExit];
    [rightButton setTitle:@"RIGHT" forState:UIControlStateNormal];
    [mainView addSubview:rightButton];
    
    enemy = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"angry_bird_red.png"]];
    [enemy setFrame:CGRectMake(xEnemy - 15, yEnemy - 15, 30, 30)];
    //enemy = [[UIImageView alloc] initWithFrame:CGRectMake(xEnemy - 15, yEnemy - 15, 30, 30)];
    //[enemy setBackgroundColor:[UIColor orangeColor]];
    [mainView addSubview:enemy];
}

/*
 * Your work
 */
- (IBAction)moveUp:(id)sender
{
    isMovingUp = true;
    [self moveUpRecursively];
}

/*
 * Your work
 */
- (IBAction)moveUpCancel:(id)sender
{
    isMovingUp = false;
}

/*
 * Your work
 */
- (void)moveUpRecursively
{
    y = y - 2;
    
    if (y % 7 == 0) {
        if (indexUp < [imagesWalkingUp count] - 1) {
            indexUp = indexUp + 1;
        } else {
            indexUp = 0;
        }
    }
    
    [UIView animateWithDuration:animateDurationCharacter animations:^ { // Play around with duration to create a 'smooth' effect
        //if (character.center.y >= 200) { // Character is within 'center range'
        //    centerY = centerY - 2;
        //    character.center = CGPointMake(centerX, centerY);
        //} else {
            // Update position of ALL objects.
            // Note: Hard to manage if we have a LOT OF objects
            // Solution: Put all objects in a data structure
        yTree += pixelSpeed;
        yHouse += pixelSpeed;
        yEnemy += pixelSpeed;
        
            // Note: We could make it more efficient, only draw objects that are on the screen, or about to appear on the screen
        tree.center = CGPointMake(xTree, yTree);
        house.center = CGPointMake(xHouse, yHouse);
        //enemy.center = CGPointMake(xEnemy, yEnemy);
        //}
        [character setImage:[imagesWalkingUp objectAtIndex:indexUp]];
        //character.center = CGPointMake(x + 20, y + 20);
        
    } completion:^(BOOL finished) {
        if (isMovingUp) {
            [self moveUpRecursively];
        }
    }];
    
}

/*
 * Already implemented
 */
- (IBAction)moveDown:(id)sender
{
    isMovingDown = true;
    [self moveDownRecursively];
}

/*
 * Already implemented
 */
- (IBAction)moveDownCancel:(id)sender
{
    isMovingDown = false;
}

/*
 * Already implemented
 */
- (void)moveDownRecursively
{
    y = y + 2;
    
    if (y % 7 == 0) {
        if (indexDown < [imagesWalkingDown count] - 1) {
            indexDown = indexDown + 1;
        } else {
            indexDown = 0;
        }
    }
    
    [UIView animateWithDuration:animateDurationCharacter animations:^ { // Play around with duration to create a 'smooth' effect
        //if (character.center.y <= 340) { // Character is within 'center range'
        //    centerY = centerY + 2;
        //    character.center = CGPointMake(centerX, centerY);
        //} else {
            // Update position of ALL objects
        yTree -= pixelSpeed;
        yHouse -= pixelSpeed;
        yEnemy -= pixelSpeed;
        
            // Note: We could make it more efficient, only draw objects that are on the screen, or about to appear on the screen
            tree.center = CGPointMake(xTree, yTree);
            house.center = CGPointMake(xHouse, yHouse);
        //enemy.center = CGPointMake(xEnemy, yEnemy);
        //}
        [character setImage:[imagesWalkingDown objectAtIndex:indexDown]];
        //character.center = CGPointMake(x + 20, y + 20);
        
        
    } completion:^(BOOL finished) {
        if (isMovingDown) {
            [self moveDownRecursively];
        }
    }];
}

/*
 * Your work
 */
- (IBAction)moveLeft:(id)sender
{
    isMovingLeft = true;
    [self moveLeftRecursively];
}

/*
 * Your work
 */
- (IBAction)moveLeftCancel:(id)sender
{
    isMovingLeft = false;
}

- (void)moveLeftRecursively
{
    x = x - 2;
    
    if (x % 7 == 0) {
        if (indexLeft < [imagesWalkingLeft count] - 1) {
            indexLeft = indexLeft + 1;
        } else {
            indexLeft = 0;
        }
    }
    
    [UIView animateWithDuration:animateDurationCharacter animations:^ { // Play around with duration to create a 'smooth' effect
        //if (character.center.x >= 110) { // Character is within 'center range'
        //    centerX = centerX - 2;
        //    character.center = CGPointMake(centerX, centerY);
        //} else {
        // Update position of ALL objects
        xTree += pixelSpeed;
        xHouse += pixelSpeed;
        xEnemy += pixelSpeed;
        
        // Note: We could make it more efficient, only draw objects that are on the screen, or about to appear on the screen
        tree.center = CGPointMake(xTree, yTree);
        house.center = CGPointMake(xHouse, yHouse);
        //enemy.center = CGPointMake(xEnemy, yEnemy);
        //}
        [character setImage:[imagesWalkingLeft objectAtIndex:indexLeft]];
        //character.center = CGPointMake(x, y);
        
        
    } completion:^(BOOL finished) {
        if (isMovingLeft) {
            [self moveLeftRecursively];
        }
    }];
}

/*
 * Your work
 */
- (IBAction)moveRight:(id)sender
{
    isMovingRight = true;
    [self moveRightRecursively];
}

/*
 * Your work
 */
- (IBAction)moveRightCancel:(id)sender
{
    isMovingRight = false;
}

/*
 * Your work
 */
- (void)moveRightRecursively
{
    x = x + 2;
    
    if (x % 7 == 0) { // walking speed itself
        if (indexRight < [imagesWalkingRight count] - 1) {
            indexRight = indexRight + 1;
        } else {
            indexRight = 0;
        }
    }
    
    [UIView animateWithDuration:animateDurationCharacter animations:^ { // Play around with duration to create a 'smooth' effect
        //if (character.center.x <= 200) { // Character is within 'center range'
        //    centerX = centerX + 2;
        //    character.center = CGPointMake(centerX, centerY);
        //} else {
        // Update position of ALL objects
        xTree -= pixelSpeed;
        xHouse -= pixelSpeed;
        xEnemy -= pixelSpeed;
        
        // Note: We could make it more efficient, only draw objects that are on the screen, or about to appear on the screen
        tree.center = CGPointMake(xTree, yTree);
        house.center = CGPointMake(xHouse, yHouse);
        //enemy.center = CGPointMake(xEnemy, yEnemy);
        //}
        [character setImage:[imagesWalkingRight objectAtIndex:indexRight]];
        
    } completion:^(BOOL finished) {
        if (xTree <= 0) {
            test = false;
        }
        if (isMovingRight) {
            [self moveRightRecursively];
        }
    }];
    
}

/*
 * Enemy thread method
 */
- (void)whatdoesthefoxsay {
    //[NSThread detachNewThreadSelector:@selector(hiccup) toTarget:self withObject:nil];
    
    while (true) {
        if (test) {
            NSLog(@"%d", test);
            test = false; // lock
            
            //int random = arc4random() % 4; // Value picked randomly (0, 1, 2, 3)
            NSLog(@"%d", random);
            //sleep(1);
            
            if (random == 3) { // enemy moves up
                //limit = arc4random() % 20 + 10;
                
                limit = 100;
                [self performSelectorOnMainThread:@selector(enemyMoveUpRecursively) withObject:nil waitUntilDone:NO];
                
            } else if (random == 1) { // enemy moves down
                limit = arc4random() % 20 + 10;
                limit = 100;
                [self performSelectorOnMainThread:@selector(enemyMoveDownRecursively) withObject:nil waitUntilDone:NO];

            } else if (random == 0) { // enemy moves left
                limit = arc4random() % 20 + 10;
                limit = 100;
                [self performSelectorOnMainThread:@selector(enemyMoveLeftRecursively) withObject:nil waitUntilDone:NO];

            } else if (random == 2) { // enemy moves right
                limit = arc4random() % 20 + 10;
                limit = 100;
                [self performSelectorOnMainThread:@selector(enemyMoveRightRecursively) withObject:nil waitUntilDone:NO];

            }
            NSLog(@"xEnemy: %d, yEnemy: %d", xEnemy, yEnemy);
            //[self performSelectorOnMainThread:@selector(animateEnemyPosition) withObject:nil waitUntilDone:NO];
            
            random++;
            if (random == 4) random = 0;
        }
    }
}

- (void)enemyMoveUpRecursively
{
    //NSLog(@"aa");
    [UIView animateWithDuration:animateDurationEnemy animations:^ { // Play around with duration to create a 'smooth' effect
        yEnemy -= objectPixelSpeed;
        limit -= objectPixelSpeed;
        enemy.center = CGPointMake(xEnemy, yEnemy);
    } completion:^(BOOL finished) {
        if (limit > 0) {
            [self enemyMoveUpRecursively];
        } else {
            test = true; // release lock
            
        }
    }];
}

- (void)enemyMoveDownRecursively
{
    //NSLog(@"aa");
    [UIView animateWithDuration:animateDurationEnemy animations:^ { // Play around with duration to create a 'smooth' effect
        yEnemy += objectPixelSpeed;
        limit -= objectPixelSpeed;
        enemy.center = CGPointMake(xEnemy, yEnemy);
    } completion:^(BOOL finished) {
        if (limit > 0) {
            [self enemyMoveDownRecursively];
        } else {
            test = true; // release lock
            
        }
    }];
}

- (void)enemyMoveLeftRecursively
{
    //NSLog(@"aa");
    [UIView animateWithDuration:animateDurationEnemy animations:^ { // Play around with duration to create a 'smooth' effect
        xEnemy -= objectPixelSpeed;
        limit -= objectPixelSpeed;
        enemy.center = CGPointMake(xEnemy, yEnemy);
    } completion:^(BOOL finished) {
        if (limit > 0) {
            [self enemyMoveLeftRecursively];
        } else {
            test = true; // release lock
            
        }
    }];
}

- (void)enemyMoveRightRecursively
{
    //NSLog(@"aa");
    [UIView animateWithDuration:animateDurationEnemy animations:^ { // Play around with duration to create a 'smooth' effect
        xEnemy += objectPixelSpeed;
        limit -= objectPixelSpeed;
        enemy.center = CGPointMake(xEnemy, yEnemy);
    } completion:^(BOOL finished) {
        if (limit > 0) {
            [self enemyMoveRightRecursively];
        } else {
            test = true; // release lock
            
        }
    }];
}


- (void)animateEnemyPosition
{
    [UIView animateWithDuration:1.0 animations:^ {
        enemy.center = CGPointMake(xEnemy, yEnemy);
    } completion:^(BOOL finished) {
        test = true; // release lock
        
    }];
}

- (void)hiccup {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
