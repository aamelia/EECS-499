#import <Foundation/Foundation.h>

@interface ListData : NSObject <NSCoding>
{
    NSString *_title;
    NSMutableArray *_list;
}


@property (strong) NSString *title;
@property (strong) NSMutableArray *list;

- (id)initWithTitle:(NSString*)title list:(NSMutableArray*)list;
//- (id)initWithTitle:(NSString*)title rating:(float)rating;

@end