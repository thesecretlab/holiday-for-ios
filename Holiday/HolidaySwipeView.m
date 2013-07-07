//
//  HolidaySwipeView.m
//  Holiday
//
//  Created by Jon Manning on 7/07/13.
//  Copyright (c) 2013 Secret Lab. All rights reserved.
//

#import "HolidaySwipeView.h"

@implementation HolidaySwipeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    
    [self addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragged:)]];
    
}

- (void) dragged:(UIPanGestureRecognizer*)pan {
    int colorBlockWidth = (int)(self.bounds.size.width / self.colors.count);
    
    float xCoord = [pan locationInView:pan.view].x;
    
    [self.delegate applyColourAtIndex:xCoord / colorBlockWidth];
}

- (void)setColors:(NSArray *)colors {
    _colors = colors;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    int i = 0;
    CGFloat colorBlockWidth = self.bounds.size.width / (float)self.colors.count;
    
    for (UIColor* color in self.colors) {
        
        CGRect paintedRegion = CGRectMake(i*colorBlockWidth, 0, colorBlockWidth, self.bounds.size.height);
        
        UIBezierPath* path = [UIBezierPath bezierPathWithRect:paintedRegion];
        [color setFill];
        [path fill];
        
        i++;
    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
