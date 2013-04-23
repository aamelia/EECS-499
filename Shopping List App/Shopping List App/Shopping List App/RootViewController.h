//
//  RootViewController.h
//  ScaryBugs
//
//  Created by Ray Wenderlich on 8/24/10.
//  Copyright Ray Wenderlich 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Welcome;

@interface RootViewController : UITableViewController <UIActionSheetDelegate>
{
    NSMutableArray *_lists;
    Welcome *_welcome;
}

@property (retain) NSMutableArray *lists;
@property (retain) Welcome *welcome;

- (void)handleOpenURL:(NSURL *)url;

@end
