//
//  GameManager.m
//  mtg-concentration-objc
//
//  Created by Glauber Lima on 24/02/17.
//  Copyright © 2017 CI&T. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "GameManager.h"
#import "Card.h"

@implementation GameManager


Card *_previousFlipped;

NSDate *_gameStartDate;

int _remainingMoves;

int _wrongMovesCount;

BOOL _isGameFinished;

- (instancetype)initWithDeck:(Deck *)deck andLinkedUICards:(NSArray *)uiCards {

    self = [super init];

    if (self) {
        _deck = deck;
        [self linkUICards:uiCards];
    }
    return self;

}

- (void)linkUICards:(NSArray *)uiCards {


    for (int i = 0; i < [self.deck.cards count]; i++) {

        Card *card = (Card *) [self.deck.cards objectAtIndex:i];

        UIView *uiCard = [uiCards objectAtIndex:card.positionOnDeck];
        uiCard.tag = card.positionOnDeck;

        card.linkedUIView = uiCard;
    }

}

- (void)start {

    UIImage *cardBackImage = [UIImage imageNamed:@"card-back"];

    for (Card *card in self.deck.cards) {

        [((UIButton *) card.linkedUIView) setBackgroundImage:cardBackImage forState:UIControlStateNormal];
    }

    _remainingMoves = [self.deck.cards count] / 2; // 10

    _wrongMovesCount = 0;
    
    _isGameFinished = NO;

}

- (void)processTap:(UIView *)view {
    
    
    if(_isGameFinished) return;

    // começa a contar ao primeiro clique
    if (!_gameStartDate) {
        _gameStartDate = [NSDate date];
    }


    int tag = (int) view.tag;

    Card *card;

    for (card in self.deck.cards) {
        if (card.positionOnDeck == tag) {
            break;
        }
    }

    if (card.isFlipped) return;


    card.isFlipped = YES;


    NSString *imageName = [NSString stringWithFormat:@"card-%d", card.value];
    UIImage *image = [UIImage imageNamed:imageName];


    [((UIButton *) card.linkedUIView) setBackgroundImage:image forState:UIControlStateNormal];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        // check matching

        if (!_previousFlipped) {
            _previousFlipped = card;
            return;
        }

        if (_previousFlipped.value == card.value) {

            card.isFlipped = YES;
            _previousFlipped = nil;
            _remainingMoves--;

            // virou todas as cartas?
            if (_remainingMoves == 0) {
                
            //                NSDate *gameEndDate = [NSDate date];
//
//                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Placar"
//                                                                               message:@"Nome"
//                                                                        preferredStyle:UIAlertControllerStyleAlert];
//
//                NSString *playerName;
//
//                UIAlertAction *action = [UIAlertAction actionWithTitle:@"Salvar"
//                                                                 style:UIAlertActionStyleDefault
//                                                               handler:^(UIAlertAction *_Nonnull action) {
//
//                                                                   //playerName =
//
//
//                                                               }];
//
//                [alert addAction:action];

            }


        } else {
            card.isFlipped = NO;
            _previousFlipped.isFlipped = NO;


            UIImage *cardBackImage = [UIImage imageNamed:@"card-back"];

            [((UIButton *) card.linkedUIView) setBackgroundImage:cardBackImage forState:UIControlStateNormal];
            [((UIButton *) _previousFlipped.linkedUIView) setBackgroundImage:cardBackImage forState:UIControlStateNormal];

            _previousFlipped = nil;

            _wrongMovesCount++;

        }


    });


}

- (void)gameDidFinish:(void (^)(void))handler {

}


@end
