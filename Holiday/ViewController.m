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
#import <CoreMotion/CoreMotion.h>

@interface ViewController () <RSColorPickerViewDelegate, HolidaySwipeViewDelegate> {
    Holiday* hol;
    UIColor* color;
    
    NSTimer* updateTimer;
    
    CMMotionManager* motion;
    
}

@end

@implementation ViewController

- (void)colorPickerDidChangeSelection:(RSColorPickerView *)cp {
    color = cp.selectionColor;
}

- (void)applyColourAtIndex:(NSUInteger)index {
    [hol setColor:color forGlobe:index];
    self.swipeView.colors = hol.globes;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    hol = [[Holiday alloc] initWithBaseURL:[NSURL URLWithString:@"http://lithia.local"]];
    
    [hol render];
    
    self.colorPicker.delegate = self;
    
    self.swipeView.colors = hol.globes;
    
    updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateHoliday) userInfo:nil repeats:YES];
    
    motion = [[CMMotionManager alloc] init];
    
    [motion startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
    
        CMAcceleration acceleration = motion.userAcceleration;
        
        float accelerationMagnitude = sqrt(pow(acceleration.x, 2) + pow(acceleration.y, 2) + pow(acceleration.z, 2));
        
        if (accelerationMagnitude > 3) {
            NSLog(@"Acceleration magnitude: %f", accelerationMagnitude);
            [hol clearWithColor:[UIColor blackColor]];
            self.swipeView.colors = hol.globes;
        }
        
    }];
    
    
}



- (void) updateHoliday {
    [hol render];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
