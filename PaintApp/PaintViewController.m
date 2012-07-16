//
//  PaintViewController.m
//  PaintApp
//
//  Created by Suhail Patel on 11/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PaintViewController.h"
#import "UIColor-Extended.h"

@interface PaintViewController ()

@end

@implementation PaintViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    drawingView = [[TouchView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    drawingView.frame = CGRectMake(0, 0, 320, 360);
    [self pressedBlue:nil];
    
    return self;
}

- (void)viewDidLoad
{    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self.view addSubview:drawingView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (IBAction)pressedRed:(id)sender 
{
    [drawingView setActiveColor:[UIColor colorWithHexString:@"F02311"]];
}

- (IBAction)pressedBlue:(id)sender
{
    [drawingView setActiveColor:[UIColor colorWithHexString:@"21AABD"]];
}

- (IBAction)pressedGreen:(id)sender
{
    [drawingView setActiveColor:[UIColor colorWithHexString:@"A1C820"]];
}

- (IBAction)pressedClear:(id)sender
{
    [drawingView clearContext];
}


@end
