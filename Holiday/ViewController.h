//
//  ViewController.h
//  Holiday
//
//  Created by Jon Manning on 7/07/13.
//  Copyright (c) 2013 Secret Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSColorPickerView.h"
#import "HolidaySwipeView.h"

@interface ViewController : UIViewController

@property (weak) IBOutlet HolidaySwipeView* swipeView;
@property (weak) IBOutlet RSColorPickerView* colorPicker;

@end
