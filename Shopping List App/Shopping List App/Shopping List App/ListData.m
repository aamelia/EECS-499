#import "ListData.h"

@implementation ListData

//@synthesize title = _title;

- (id)init
{
	if (!(self = [super init]))
		return nil;
    
    title = [[NSString alloc] init];
    list = [[NSMutableArray alloc] init];
    return (self);
}

- (id)initWithTitle:(NSString*)title list:(NSMutableArray*)list
{
    if ((self = [super init]))
    {
        self.title = title;
    }
    
    return self;
}

#pragma mark NSCoding

#define kTitleKey       @"Title"
#define kListKey        @"List"

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_title forKey:kTitleKey];
    [encoder encodeObject:_list forKey:kListKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    NSString *title = [decoder decodeObjectForKey:kTitleKey];
    NSMutableArray *list = [decoder decodeObjectForKey:kListKey];
    return [self initWithTitle:title list:list];
}

@end

