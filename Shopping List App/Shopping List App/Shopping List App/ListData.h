#import <Foundation/Foundation.h>

@interface ListData : NSObject <NSCoding>
{
    NSString *title;
    NSMutableArray *list;
}


@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSMutableArray *list;

- (id)initWithTitle:(NSString*)title list:(NSMutableArray*)list;

@end