//
//  Card.h
//  mtg-concentration-objc
//
//  Created by Glauber Lima on 24/02/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Card : NSObject

@property (nonatomic) int positionOnDeck;
@property (nonatomic) int value;
@property (nonatomic) BOOL isFlipped;

@property (nonatomic) UIView* linkedUIView;

@end
