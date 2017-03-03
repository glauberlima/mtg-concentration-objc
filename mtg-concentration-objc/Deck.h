//
//  Deck.h
//  mtg-concentration-objc
//
//  Created by Glauber Lima on 24/02/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Deck : NSObject

@property (nonatomic, readonly) NSArray *cards;

-(instancetype)init;

@end
