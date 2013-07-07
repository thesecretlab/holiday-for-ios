//
//  Holiday.h
//  Holiday
//
//  Created by Jon Manning on 7/07/13.
//  Copyright (c) 2013 Secret Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface Holiday : AFHTTPClient

@property (nonatomic, strong) NSArray* globes;

- (void) setColor:(UIColor*)color forGlobe:(NSUInteger)globeNumber;

- (UIColor*) globe:(NSUInteger)globeNumber;

- (void) render;

- (void) clearWithColor:(UIColor*)color;

@end
