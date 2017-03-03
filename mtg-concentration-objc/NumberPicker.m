//
//  NumberPicker.m
//  mtg-concentration-objc
//
//  Created by Glauber Lima on 24/02/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

#import "NumberPicker.h"

@implementation NumberPicker

- (instancetype)initWithRangeFromZeroTo:(int)upperBound andRepetitions:(int)repetitions {
    
    self = [super init];
    
    if (self) {
        
        _range = [NSMutableArray new];
        
        for (int r = 1; r <= repetitions; r++) {
            
            for (int i = 0; i < upperBound; i++) {
                [_range addObject:[NSNumber numberWithInt:i]];
            }
            
        }
    }
    return self;
}

- (int)pickRandomAndRemove {
    
    
    int max = (int) [_range count];
    
    NSUInteger randomIndex = arc4random_uniform(max);
    
    int valueAtPosition = [[_range objectAtIndex:randomIndex] intValue];
    
    [_range removeObjectAtIndex:randomIndex];
    
    //NSLog(@"randomIndex = %d, value = %d", randomIndex, valueAtPosition);
    
    return valueAtPosition;
}

@end
