//
//  TouchPoint.h
//  Tester
//
//  Created by Suhail Patel on 10/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchPoint : NSObject {
    CGPoint point;
    UIColor *color;
}

@property (nonatomic, assign) CGPoint point;
@property (nonatomic, retain) UIColor *color;

@end
