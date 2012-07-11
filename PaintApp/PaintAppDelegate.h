//
//  PaintAppDelegate.h
//  PaintApp
//
//  Created by Suhail Patel on 11/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PaintViewController;

@interface PaintAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) PaintViewController *viewController;

@end
