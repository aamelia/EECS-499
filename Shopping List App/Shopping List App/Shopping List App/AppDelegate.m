//
//  ScaryBugsAppDelegate.m
//  ScaryBugs
//
//  Created by Ray Wenderlich on 8/24/10.
//  Copyright Ray Wenderlich 2010. All rights reserved.
//

#import "AppDelegate.h"
#import "Welcome.h"
#import "ListDoc.h"
#import "ListDatabase.h"

@implementation AppDelegate

@synthesize window;
@synthesize navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    allLists = [[NSMutableArray alloc] init];
    NSMutableArray *loadedLists = [ListDatabase loadListDocs];
    allLists = loadedLists;
    
    Welcome *rootController = (Welcome *) [navigationController.viewControllers objectAtIndex:0];
    
    // Add the navigation controller's view to the window and display.
    [window addSubview:navigationController.view];
    [window makeKeyAndVisible];
    
    NSURL *url = (NSURL *)[launchOptions valueForKey:UIApplicationLaunchOptionsURLKey];
    if (url != nil && [url isFileURL])
    {
        //[self handleOpenURL:url];
    }
    return YES;

}

-(BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    /*
    Welcome *rootController = (Welcome *) [navigationController.viewControllers objectAtIndex:0];

    if(rootController == nil)
        NSLog(@"Nil");
    if (url != nil && [url isFileURL])
    {
        NSLog(@"passing to rootController");
        [rootController passToMyLists:url];
    }
    return YES;
    */
    
    ListDoc *newDoc = [[ListDoc alloc] init];
    if ([newDoc importFromURL:url])
    {
        [allLists addObject:newDoc];
    }
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}
/*
-(BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    
    RootViewController *rootController = (RootViewController *) [[navigationController.viewControllers objectAtIndex:0];
    if (url != nil && [url isFileURL])
    {
        [rootController handleOpenURL:url];
    }
    return YES;
    
}
*/
- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}
- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}
#pragma mark -
#pragma mark Memory management
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}
@end

