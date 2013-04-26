#import <UIKit/UIKit.h>
#import "ListData.h"
#import "ListDoc.h"
#import "Item.h"

NSMutableArray *allLists;
int numLists;
int currentListIndex;
int currentItemIndex;

@interface AppDelegate : NSObject <UIApplicationDelegate>
{    
    UIWindow *window;
    //UINavigationController *navigationController;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (void)handleOpenURL:(NSURL *)url;

@end

