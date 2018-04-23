//
//  Circle.m
//  AlarmProject
//
//  Created by Dat Phan on 5/21/14.
//  Copyright (c) 2014 Dat Phan. All rights reserved.
//

#import "Star.h"
#import "RGBColor.h"

@implementation Star

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self drawStarWithWidth:widthSegment height:heightSegment frame:rect];
    
}

- (void)drawStarWithWidth:(int)w height:(int)h frame:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    int x = rect.origin.x;
    int y = rect.origin.y;
    int width = rect.size.width;
    int height = rect.size.height;
    
    while (width % w != 0) width -= 1;
    while (height % h != 0) height -= 1;
    
    int smallWidth = width / w;
    int smallHeight = height / h;
    
    for (int i = 0; i < h; ++i) {
        x = rect.origin.x;
        for (int j = 0; j < w; ++j) {
            RGBColor *rgbC = (RGBColor *)[[rgbArray objectAtIndex:i] objectAtIndex:j];
            UIColor *c = [UIColor colorWithRed:[rgbC red]/255.0 green:[rgbC green]/255.0 blue:[rgbC blue]/255.0 alpha:1];
            CGContextSetFillColorWithColor(context, c.CGColor);
            CGContextFillRect(context, CGRectMake(x, y, smallWidth, smallHeight));
            x += smallWidth;
        }
        y += smallHeight;
    }

}

- (void)setupStarSmallDimBlue
{
    widthSegment = 5;
    heightSegment = 4;
    rgbArray = [[NSMutableArray alloc] initWithCapacity:4];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:15 green:21 blue:30],
                         [[RGBColor alloc] initWithRed:21 green:29 blue:39],
                         [[RGBColor alloc] initWithRed:27 green:35 blue:45],
                         [[RGBColor alloc] initWithRed:25 green:34 blue:43],
                         [[RGBColor alloc] initWithRed:13 green:20 blue:30],
                         nil ]];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:23 green:30 blue:40],
                         [[RGBColor alloc] initWithRed:65 green:76 blue:87],
                         [[RGBColor alloc] initWithRed:109 green:121 blue:134],
                         [[RGBColor alloc] initWithRed:73 green:84 blue:96],
                         [[RGBColor alloc] initWithRed:22 green:32 blue:40],
                         nil ]];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:27 green:33 blue:46],
                         [[RGBColor alloc] initWithRed:83 green:94 blue:106],
                         [[RGBColor alloc] initWithRed:144 green:157 blue:171],
                         [[RGBColor alloc] initWithRed:84 green:98 blue:109],
                         [[RGBColor alloc] initWithRed:25 green:35 blue:43],
                         nil ]];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:20 green:25 blue:37],
                         [[RGBColor alloc] initWithRed:42 green:52 blue:62],
                         [[RGBColor alloc] initWithRed:69 green:79 blue:91],
                         [[RGBColor alloc] initWithRed:36 green:47 blue:57],
                         [[RGBColor alloc] initWithRed:14 green:22 blue:30],
                         nil ]];
    
}

- (void)setupStarSmallBrightBlue
{
    widthSegment = 7;
    heightSegment = 7;
    rgbArray = [[NSMutableArray alloc] initWithCapacity:7];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:1 green:1 blue:1],
                         [[RGBColor alloc] initWithRed:10 green:10 blue:10],
                         [[RGBColor alloc] initWithRed:16 green:27 blue:60],
                         [[RGBColor alloc] initWithRed:3 green:25 blue:61],
                         [[RGBColor alloc] initWithRed:26 green:29 blue:33],
                         [[RGBColor alloc] initWithRed:14 green:14 blue:29],
                         [[RGBColor alloc] initWithRed:1 green:1 blue:1],
                         nil ]];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:1 green:1 blue:1],
                         [[RGBColor alloc] initWithRed:39 green:46 blue:81],
                         [[RGBColor alloc] initWithRed:81 green:94 blue:129],
                         [[RGBColor alloc] initWithRed:133 green:145 blue:186],
                         [[RGBColor alloc] initWithRed:93 green:106 blue:157],
                         [[RGBColor alloc] initWithRed:34 green:42 blue:74],
                         [[RGBColor alloc] initWithRed:22 green:23 blue:37],
                         nil ]];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:19 green:24 blue:54],
                         [[RGBColor alloc] initWithRed:92 green:107 blue:147],
                         [[RGBColor alloc] initWithRed:206 green:212 blue:232],
                         [[RGBColor alloc] initWithRed:252 green:255 blue:255],
                         [[RGBColor alloc] initWithRed:203 green:215 blue:239],
                         [[RGBColor alloc] initWithRed:75 green:91 blue:155],
                         [[RGBColor alloc] initWithRed:23 green:24 blue:58],
                         nil ]];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:0 green:7 blue:42],
                         [[RGBColor alloc] initWithRed:106 green:123 blue:164],
                         [[RGBColor alloc] initWithRed:246 green:249 blue:249],
                         [[RGBColor alloc] initWithRed:255 green:255 blue:255],
                         [[RGBColor alloc] initWithRed:240 green:245 blue:251],
                         [[RGBColor alloc] initWithRed:100 green:115 blue:189],
                         [[RGBColor alloc] initWithRed:11 green:13 blue:70],
                         nil ]];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:10 green:15 blue:33],
                         [[RGBColor alloc] initWithRed:71 green:88 blue:155],
                         [[RGBColor alloc] initWithRed:200 green:207 blue:230],
                         [[RGBColor alloc] initWithRed:244 green:247 blue:241],
                         [[RGBColor alloc] initWithRed:195 green:204 blue:222],
                         [[RGBColor alloc] initWithRed:72 green:86 blue:166],
                         [[RGBColor alloc] initWithRed:26 green:28 blue:70],
                         nil ]];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:25 green:28 blue:40],
                         [[RGBColor alloc] initWithRed:39 green:50 blue:107],
                         [[RGBColor alloc] initWithRed:88 green:100 blue:175],
                         [[RGBColor alloc] initWithRed:119 green:132 blue:204],
                         [[RGBColor alloc] initWithRed:87 green:97 blue:177],
                         [[RGBColor alloc] initWithRed:32 green:40 blue:104],
                         [[RGBColor alloc] initWithRed:25 green:28 blue:43],
                         nil ]];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:14 green:15 blue:28],
                         [[RGBColor alloc] initWithRed:15 green:21 blue:42],
                         [[RGBColor alloc] initWithRed:22 green:31 blue:86],
                         [[RGBColor alloc] initWithRed:25 green:32 blue:112],
                         [[RGBColor alloc] initWithRed:32 green:40 blue:94],
                         [[RGBColor alloc] initWithRed:25 green:30 blue:52],
                         [[RGBColor alloc] initWithRed:1 green:1 blue:1],
                         nil ]];
}

- (void)setupStarTwinkleOrange
{
    widthSegment = 10;
    heightSegment = 10;
    rgbArray = [[NSMutableArray alloc] initWithCapacity:10];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:8 green:6 blue:7],
                         [[RGBColor alloc] initWithRed:10 green:8 blue:8],
                         [[RGBColor alloc] initWithRed:1 green:6 blue:7],
                         [[RGBColor alloc] initWithRed:16 green:10 blue:8],
                         [[RGBColor alloc] initWithRed:23 green:12 blue:10],
                         [[RGBColor alloc] initWithRed:14 green:7 blue:7],
                         [[RGBColor alloc] initWithRed:5 green:7 blue:6],
                         [[RGBColor alloc] initWithRed:24 green:10 blue:9],
                         [[RGBColor alloc] initWithRed:13 green:8 blue:8],
                         [[RGBColor alloc] initWithRed:3 green:5 blue:6],
                         nil ]];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:3 green:5 blue:7],
                         [[RGBColor alloc] initWithRed:1 green:4 blue:6],
                         [[RGBColor alloc] initWithRed:23 green:10 blue:9],
                         [[RGBColor alloc] initWithRed:0 green:0 blue:2],
                         [[RGBColor alloc] initWithRed:0 green:0 blue:0],
                         [[RGBColor alloc] initWithRed:8 green:13 blue:11],
                         [[RGBColor alloc] initWithRed:32 green:13 blue:10],
                         [[RGBColor alloc] initWithRed:35 green:15 blue:10],
                         [[RGBColor alloc] initWithRed:4 green:5 blue:7],
                         [[RGBColor alloc] initWithRed:7 green:6 blue:6],
                         nil ]];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:26 green:12 blue:9],
                         [[RGBColor alloc] initWithRed:25 green:13 blue:11],
                         [[RGBColor alloc] initWithRed:0 green:0 blue:2],
                         [[RGBColor alloc] initWithRed:56 green:27 blue:19],
                         [[RGBColor alloc] initWithRed:93 green:42 blue:34],
                         [[RGBColor alloc] initWithRed:52 green:11 blue:18],
                         [[RGBColor alloc] initWithRed:104 green:34 blue:19],
                         [[RGBColor alloc] initWithRed:33 green:14 blue:9],
                         [[RGBColor alloc] initWithRed:1 green:4 blue:7],
                         [[RGBColor alloc] initWithRed:13 green:8 blue:8],
                         nil ]];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:13 green:10 blue:9],
                         [[RGBColor alloc] initWithRed:74 green:26 blue:16],
                         [[RGBColor alloc] initWithRed:94 green:19 blue:17],
                         [[RGBColor alloc] initWithRed:173 green:73 blue:39],
                         [[RGBColor alloc] initWithRed:232 green:110 blue:44],
                         [[RGBColor alloc] initWithRed:207 green:68 blue:36],
                         [[RGBColor alloc] initWithRed:141 green:50 blue:24],
                         [[RGBColor alloc] initWithRed:1 green:8 blue:12],
                         [[RGBColor alloc] initWithRed:26 green:11 blue:8],
                         [[RGBColor alloc] initWithRed:8 green:7 blue:7],
                         nil ]];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:14 green:9 blue:7],
                         [[RGBColor alloc] initWithRed:7 green:15 blue:14],
                         [[RGBColor alloc] initWithRed:133 green:31 blue:23],
                         [[RGBColor alloc] initWithRed:232 green:107 blue:53],
                         [[RGBColor alloc] initWithRed:245 green:201 blue:175],
                         [[RGBColor alloc] initWithRed:246 green:203 blue:182],
                         [[RGBColor alloc] initWithRed:205 green:94 blue:54],
                         [[RGBColor alloc] initWithRed:59 green:10 blue:10],
                         [[RGBColor alloc] initWithRed:10 green:18 blue:15],
                         [[RGBColor alloc] initWithRed:17 green:6 blue:6],
                         nil ]];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:24 green:9 blue:6],
                         [[RGBColor alloc] initWithRed:8 green:20 blue:20],
                         [[RGBColor alloc] initWithRed:81 green:14 blue:14],
                         [[RGBColor alloc] initWithRed:233 green:116 blue:62],
                         [[RGBColor alloc] initWithRed:255 green:255 blue:245],
                         [[RGBColor alloc] initWithRed:255 green:252 blue:242],
                         [[RGBColor alloc] initWithRed:231 green:112 blue:64],
                         [[RGBColor alloc] initWithRed:69 green:12 blue:12],
                         [[RGBColor alloc] initWithRed:7 green:18 blue:18],
                         [[RGBColor alloc] initWithRed:19 green:6 blue:5],
                         nil ]];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:14 green:7 blue:7],
                         [[RGBColor alloc] initWithRed:21 green:16 blue:11],
                         [[RGBColor alloc] initWithRed:21 green:2 blue:7],
                         [[RGBColor alloc] initWithRed:193 green:73 blue:33],
                         [[RGBColor alloc] initWithRed:241 green:170 blue:113],
                         [[RGBColor alloc] initWithRed:237 green:147 blue:100],
                         [[RGBColor alloc] initWithRed:187 green:71 blue:32],
                         [[RGBColor alloc] initWithRed:107 green:42 blue:23],
                         [[RGBColor alloc] initWithRed:66 green:19 blue:15],
                         [[RGBColor alloc] initWithRed:21 green:10 blue:9],
                         nil ]];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:12 green:7 blue:7],
                         [[RGBColor alloc] initWithRed:6 green:7 blue:6],
                         [[RGBColor alloc] initWithRed:33 green:9 blue:10],
                         [[RGBColor alloc] initWithRed:117 green:54 blue:23],
                         [[RGBColor alloc] initWithRed:153 green:41 blue:27],
                         [[RGBColor alloc] initWithRed:120 green:21 blue:21],
                         [[RGBColor alloc] initWithRed:38 green:14 blue:12],
                         [[RGBColor alloc] initWithRed:70 green:26 blue:14],
                         [[RGBColor alloc] initWithRed:86 green:24 blue:16],
                         [[RGBColor alloc] initWithRed:39 green:14 blue:11],
                         nil ]];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:12 green:7 blue:7],
                         [[RGBColor alloc] initWithRed:0 green:3 blue:8],
                         [[RGBColor alloc] initWithRed:53 green:19 blue:12],
                         [[RGBColor alloc] initWithRed:84 green:30 blue:16],
                         [[RGBColor alloc] initWithRed:5 green:17 blue:22],
                         [[RGBColor alloc] initWithRed:8 green:20 blue:22],
                         [[RGBColor alloc] initWithRed:1 green:7 blue:7],
                         [[RGBColor alloc] initWithRed:0 green:0 blue:7],
                         [[RGBColor alloc] initWithRed:1 green:7 blue:7],
                         [[RGBColor alloc] initWithRed:23 green:10 blue:9],
                         nil ]];
    
    [rgbArray addObject:[[NSArray alloc] initWithObjects:[[RGBColor alloc] initWithRed:2 green:5 blue:6],
                         [[RGBColor alloc] initWithRed:15 green:8 blue:9],
                         [[RGBColor alloc] initWithRed:31 green:15 blue:11],
                         [[RGBColor alloc] initWithRed:2 green:9 blue:8],
                         [[RGBColor alloc] initWithRed:24 green:10 blue:6],
                         [[RGBColor alloc] initWithRed:25 green:10 blue:5],
                         [[RGBColor alloc] initWithRed:17 green:8 blue:7],
                         [[RGBColor alloc] initWithRed:15 green:9 blue:8],
                         [[RGBColor alloc] initWithRed:9 green:6 blue:8],
                         [[RGBColor alloc] initWithRed:1 green:5 blue:6],
                         nil ]];
    
}


@end
