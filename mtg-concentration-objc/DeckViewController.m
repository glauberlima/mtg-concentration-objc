//
//  DeckViewController.m
//  mtg-concentration-objc
//
//  Created by Glauber Lima on 24/02/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

#import "DeckViewController.h"
#import "Deck.h"
#import "Card.h"
#import "GameManager.h"
#import "AppDelegate.h"
#import "HiScoreMO+CoreDataClass.h"
#import "HiScore+CoreDataClass.h"

@interface DeckViewController ()


@property(weak, nonatomic) IBOutlet UIButton *uiCard1;
@property(weak, nonatomic) IBOutlet UIButton *uiCard2;
@property(weak, nonatomic) IBOutlet UIButton *uiCard3;
@property(weak, nonatomic) IBOutlet UIButton *uiCard4;
@property(weak, nonatomic) IBOutlet UIButton *uiCard5;
@property(weak, nonatomic) IBOutlet UIButton *uiCard6;
@property(weak, nonatomic) IBOutlet UIButton *uiCard7;
@property(weak, nonatomic) IBOutlet UIButton *uiCard8;
@property(weak, nonatomic) IBOutlet UIButton *uiCard9;
@property(weak, nonatomic) IBOutlet UIButton *uiCard10;
@property(weak, nonatomic) IBOutlet UIButton *uiCard11;
@property(weak, nonatomic) IBOutlet UIButton *uiCard12;
@property(weak, nonatomic) IBOutlet UIButton *uiCard13;
@property(weak, nonatomic) IBOutlet UIButton *uiCard14;
@property(weak, nonatomic) IBOutlet UIButton *uiCard15;
@property(weak, nonatomic) IBOutlet UIButton *uiCard16;
@property(weak, nonatomic) IBOutlet UIButton *uiCard17;
@property(weak, nonatomic) IBOutlet UIButton *uiCard18;
@property(weak, nonatomic) IBOutlet UIButton *uiCard19;
@property(weak, nonatomic) IBOutlet UIButton *uiCard20;


@end

@implementation DeckViewController

GameManager *_gm;

- (IBAction)cardTapDetected:(id)sender {

    UIView *view = (UIView *) sender;

    [_gm processTap:view];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view


    Deck *deck = [Deck new];

    NSArray *uiCards = @[_uiCard1, _uiCard2, _uiCard3, _uiCard4, _uiCard5, _uiCard6, _uiCard7, _uiCard8, _uiCard9, _uiCard10, _uiCard11, _uiCard12, _uiCard13, _uiCard14, _uiCard15,
            _uiCard16, _uiCard17, _uiCard18, _uiCard19, _uiCard20];


    _gm = [[GameManager alloc] initWithDeck:deck andLinkedUICards:uiCards];


    [_gm gameDidFinish:^{


        NSManagedObjectContext *context = ((AppDelegate *) [[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;


        //NSManagedObject *entityNameObj = [NSEntityDescription insertNewObjectForEntityForName:@"HiScore" inManagedObjectContext:context];
        //[entityNameObj setValue:@"someValue" forKey:@"someKey"];

        HiScore *hiScore;
        hiScore.playerName = @"glauber";
        hiScore.wrongMoves = 10;
        hiScore.gameDuration = 5000;
        hiScore.gameDate = [NSDate date];


    }];


    [_gm start];


    // [_gm registerHiScore]


}


@end
