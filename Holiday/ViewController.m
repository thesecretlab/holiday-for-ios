//
//  ViewController.m
//  Holiday
//
//  Created by Jon Manning on 7/07/13.
//  Copyright (c) 2013 Secret Lab. All rights reserved.
//

#import "ViewController.h"
#import "Holiday.h"
#import "RSColorPickerView.h"
#import "HolidaySwipeView.h"

@interface ViewController () <RSColorPickerViewDelegate, HolidaySwipeViewDelegate> {
    Holiday* hol;
    UIColor* color;
}

@end

@implementation ViewController

- (void)colorPickerDidChangeSelection:(RSColorPickerView *)cp {
    color = cp.selectionColor;
}

- (void)applyColourAtIndex:(NSUInteger)index {
    [hol setColor:color forGlobe:index];
    self.swipeView.colors = hol.globes;
    [hol render];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    hol = [[Holiday alloc] initWithBaseURL:[NSURL URLWithString:@"http://lithia.local"]];
    
    [hol setColor:[UIColor redColor] forGlobe:2];
    
    [hol render];
    
    self.colorPicker.delegate = self;
    
    self.swipeView.colors = hol.globes;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
