//
//  Deck.m
//  mtg-concentration-objc
//
//  Created by Glauber Lima on 24/02/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

#import "Deck.h"
#import "Card.h"
#import "NumberPicker.h"

@implementation Deck

static int TOTAL_CARD_COUNT = 20;

-(instancetype)init {
    
    self = [super init];
    
    if(self)
    {
        _cards = [self randomizeCards];
        
    }
    return self;
}

-(NSArray *) randomizeCards {
    
    int uniqueCardCount = TOTAL_CARD_COUNT / 2;
    
    NumberPicker *positions = [[NumberPicker alloc] initWithRangeFromZeroTo:TOTAL_CARD_COUNT andRepetitions:1];
    NumberPicker *values = [[NumberPicker alloc] initWithRangeFromZeroTo:uniqueCardCount andRepetitions:2];

    NSMutableArray *cards = [NSMutableArray new];
    
    for(int i = 0; i < TOTAL_CARD_COUNT; i++) {
        
        Card *card = [Card new];
        card.value = [values pickRandomAndRemove];
        card.positionOnDeck = [positions pickRandomAndRemove];
        card.isFlipped = NO;
        [cards addObject:card];
    }
    
    
    return cards;
    
    
}

@end
