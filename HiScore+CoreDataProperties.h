//
//  HiScore+CoreDataProperties.h
//  mtg-concentration-objc
//
//  Created by Glauber Lima on 02/03/17.
//  Copyright © 2017 CI&T. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "HiScore+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface HiScore (CoreDataProperties)

+ (NSFetchRequest<HiScore *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *playerName;
@property (nonatomic) int64_t gameDuration;
@property (nonatomic) int16_t correctMoves;
@property (nonatomic) int16_t wrongMoves;
@property (nullable, nonatomic, copy) NSDate *gameDate;

@end

NS_ASSUME_NONNULL_END
