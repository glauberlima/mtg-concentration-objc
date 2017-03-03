//
//  GameManager.h
//  mtg-concentration-objc
//
//  Created by Glauber Lima on 24/02/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface GameManager : NSObject

@property(readonly) Deck *deck;

- (instancetype)initWithDeck:(Deck *)deck andLinkedUICards:(NSArray *)uiCards;

- (void)start;

- (void)processTap:(UIView *)view;

- (void)gameDidFinish:(void (^)(void))handler;

@end