//
//  AppDelegate.h
//  Shopping List
//
//  Created by Mia Atkinson on 2/2/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingList.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSMutableArray *myLists;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) NSMutableArray *myLists;

@end
