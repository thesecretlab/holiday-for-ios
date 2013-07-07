//
//  HolidaySwipeView.h
//  Holiday
//
//  Created by Jon Manning on 7/07/13.
//  Copyright (c) 2013 Secret Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HolidaySwipeViewDelegate <NSObject>

- (void) applyColourAtIndex:(NSUInteger)index;

@end

@interface HolidaySwipeView : UIView

@property (nonatomic, strong) NSArray* colors;
@property (weak) IBOutlet id<HolidaySwipeViewDelegate> delegate;

@end
