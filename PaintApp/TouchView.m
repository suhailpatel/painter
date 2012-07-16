//
//  TouchView.m
//  Tester
//
//  Created by Suhail Patel on 10/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TouchView.h"
#import "TouchPoint.h"
#import <QuartzCore/QuartzCore.h>

#define CIRCLE_WIDTH 12.0

@implementation TouchView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        points = [[NSMutableArray alloc] init];

        // Get a Image of the View
        UIGraphicsBeginImageContext(self.bounds.size);
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        maskRef = [viewImage CGImage];
        activeColor = [UIColor blueColor];
        
        [self setBackgroundColor:[UIColor clearColor]];
        self.clearsContextBeforeDrawing = YES;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextDrawImage(context, self.bounds, maskRef);
    CGContextClipToMask(context, self.bounds, maskRef);
    CGContextSetBlendMode(context, kCGBlendModeColorBurn); 
    
    if ([points count] > 0) {
        TouchPoint *touch = [points objectAtIndex:[points count]-1];
        CGPathAddEllipseInRect(circlesPath, NULL, CGRectMake(touch.point.x, touch.point.y, CIRCLE_WIDTH, CIRCLE_WIDTH));
    } else {
        circlesPath = CGPathCreateMutable();
    }

    // Set our color
    CGColorRef color = [activeColor CGColor];
    CGContextSetRGBFillColor(context, CGColorGetComponents(color)[0], CGColorGetComponents(color)[1], CGColorGetComponents(color)[2], CGColorGetComponents(color)[3]);
    
    CGContextAddPath(context, circlesPath);
    CGContextFillPath(context);
}

- (void)setActiveColor:(UIColor *)color
{
    activeColor = color;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
    UITouch *touch = (UITouch *)[touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    TouchPoint *touchPoint = [[TouchPoint alloc] init];
    touchPoint.point = point;
    touchPoint.color = activeColor;
    [points addObject:touchPoint];
    
    [self setNeedsDisplayInRect:CGRectMake(touchPoint.point.x, touchPoint.point.y, CIRCLE_WIDTH, CIRCLE_WIDTH)];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = (UITouch *)[touches anyObject];
    CGPoint point = [touch locationInView:self];

    TouchPoint *touchPoint = [[TouchPoint alloc] init];
    touchPoint.point = point;
    touchPoint.color = activeColor;
    [points addObject:touchPoint];
    
    [self setNeedsDisplayInRect:CGRectMake(touchPoint.point.x, touchPoint.point.y, CIRCLE_WIDTH, CIRCLE_WIDTH)];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event { }
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event { }

- (void)clearContext
{
    [points removeAllObjects];
    [self setNeedsDisplayInRect:self.bounds];
}

@end
