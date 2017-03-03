//
//  AppDelegate.h
//  mtg-concentration-objc
//
//  Created by Glauber Lima on 24/02/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

