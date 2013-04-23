#import <UIKit/UIKit.h>


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
//@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

