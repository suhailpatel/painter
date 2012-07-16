//
//  TouchView.h
//  Tester
//
//  Created by Suhail Patel on 10/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchView : UIView {
    NSMutableArray *points;
    UIColor *activeColor;
    CGMutablePathRef circlesPath;
    CGImageRef maskRef;
}

- (void)setActiveColor:(UIColor *)color;
- (void)clearContext;

@end
