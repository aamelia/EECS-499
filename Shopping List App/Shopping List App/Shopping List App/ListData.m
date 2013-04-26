
#import "ListData.h"

@implementation ListData
@synthesize title = _title;
@synthesize items = _items;

- (id)init
{
	if (!(self = [super init]))
		return nil;

    _title = [[NSString alloc] init];
    _items = [[NSMutableArray alloc] init];
    return (self);
}

- (id)initWithTitle:(NSString*)title items:(NSMutableArray*)items
{
    if ((self = [super init]))
    {
        _title = title;
        _items = items;
    }
    return self;
}

#pragma mark NSCoding

#define kTitleKey       @"Title"
#define kItemsKey       @"Items"

- (void) encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:_title forKey:kTitleKey];
    [encoder encodeObject:_items forKey:kItemsKey];

}

- (id)initWithCoder:(NSCoder *)decoder
{
    NSString *title = [decoder decodeObjectForKey:kTitleKey];
    NSMutableArray *items = [decoder decodeObjectForKey:kItemsKey];
    return [self initWithTitle:title items:items];
}

@end
