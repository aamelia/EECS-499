
#import <Foundation/Foundation.h>
#import "Item.h"

@interface ListData : NSObject <NSCoding>
{
    NSString *_title;
    NSMutableArray *_items;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSMutableArray *items;

- (id)init;
- (id)initWithTitle:(NSString*)title items:(NSMutableArray*)items;

@end
