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

}

+ (NSUInteger)numberOfGlobes {
    return 50;
}

- (NSArray *)globes {
    return _globes;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        
        _globes = [NSMutableArray arrayWithCapacity:[Holiday numberOfGlobes]];
        
        [self setParameterEncoding:AFJSONParameterEncoding];
        
        for (int i = 0; i < [Holiday numberOfGlobes]; i++) {
            [_globes addObject:[UIColor blackColor]];
        }
        
    }
    return self;
}

- (void) setColor:(UIColor*)color forGlobe:(NSUInteger)globeNumber {
    if (globeNumber >= _globes.count)
        return;
    
    _globes[globeNumber] = color;
    
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

    [self putPath:@"/device/light/setlights" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success!");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Fail!");
    }];
}


@end
