//
//  Holiday.m
//  Holiday
//
//  Created by Jon Manning on 7/07/13.
//  Copyright (c) 2013 Secret Lab. All rights reserved.
//

#import "Holiday.h"
#import "UIColor+Expanded.h"

@implementation Holiday {
    NSMutableArray* _globes;
    
    NSDictionary* _lastSentData;

}

@synthesize globes = _globes;

+ (NSUInteger)numberOfGlobes {
    return 50;
}

- (void)setGlobes:(NSArray *)globes {
    _globes = [NSMutableArray arrayWithArray:globes];
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        
        _globes = [NSMutableArray arrayWithCapacity:[Holiday numberOfGlobes]];
        
        [self setParameterEncoding:AFJSONParameterEncoding];
        
        [self clearWithColor:[UIColor blackColor]];
        
    }
    return self;
}

- (void) setColor:(UIColor*)color forGlobe:(NSUInteger)globeNumber {
    if (globeNumber >= _globes.count)
        return;
    
    _globes[globeNumber] = color;
    
}

- (void) clearWithColor:(UIColor*)color {
    [_globes removeAllObjects];
    
    for (int i = 0; i < [Holiday numberOfGlobes]; i++) {
        [_globes addObject:color];
    }
}

- (UIColor*) globe:(NSUInteger)globeNumber {
    return [_globes objectAtIndex:globeNumber];
}

- (void) render {
    NSMutableArray* renderedStrings = [NSMutableArray array];
    
    for (UIColor* color in _globes) {
        [renderedStrings addObject:[NSString stringWithFormat:@"#%@", [color hexStringValue]]];
    }
    
    NSDictionary* dict = @{@"lights":renderedStrings};
    
    // Send an update, if anything has changed
    if ([dict isEqualToDictionary:_lastSentData] == NO) {

        [self putPath:@"/device/light/setlights" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            _lastSentData = dict;
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
        }];
    }
}


@end
