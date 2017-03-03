//
//  HiScore+CoreDataProperties.m
//  mtg-concentration-objc
//
//  Created by Glauber Lima on 02/03/17.
//  Copyright © 2017 CI&T. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "HiScore+CoreDataProperties.h"

@implementation HiScore (CoreDataProperties)

+ (NSFetchRequest<HiScore *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"HiScore"];
}

@dynamic playerName;
@dynamic gameDuration;
@dynamic correctMoves;
@dynamic wrongMoves;
@dynamic gameDate;

@end
