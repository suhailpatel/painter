//
//  PaintViewController.h
//  PaintApp
//
//  Created by Suhail Patel on 11/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchView.h"

@interface PaintViewController : UIViewController {
    IBOutlet TouchView *drawingView;
}

- (IBAction)pressedRed:(id)sender;
- (IBAction)pressedGreen:(id)sender;
- (IBAction)pressedBlue:(id)sender;
- (IBAction)pressedClear:(id)sender;

@end
