//
//  NumberPicker.h
//  mtg-concentration-objc
//
//  Created by Glauber Lima on 24/02/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumberPicker : NSObject

@property(readonly) NSMutableArray *range;

- (int)pickRandomAndRemove;

- (instancetype)initWithRangeFromZeroTo:(int)upperBound andRepetitions:(int)repetitions;


@end
