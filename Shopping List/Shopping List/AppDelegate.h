//
//  AppDelegate.h
//  Shopping List
//
//  Created by Mia Atkinson on 2/2/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK.framework/FacebookSDK.h>
//#import "FacebookSDK.framework/Versions/A/Headers/FacebookSDK.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

extern NSString *const FBSessionStateChangedNotification;
- (BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI;

@property (strong, nonatomic) UIWindow *window;

@end
