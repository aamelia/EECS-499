//
//  Item.m
//  Shopping List App
//
//  Created by Mia Atkinson on 3/21/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import "Item.h"

@implementation Item
@synthesize image, details, name;

- (id)init
{
	if (!(self = [super init]))
		return nil;
    
    name = [[NSString alloc] init];
    details = [[NSString alloc] init];
    name = @"Test name - Change in Item.m";
    details = @"Enter item details here";
    return (self);
}

- (id)initWithName:(NSString*)nName details:(NSString*)nDetails image:(UIImage*)nImage
{
    if ((self = [super init]))
    {
        name = nName;
        details = nDetails;
        image = nImage;
    }
    return self;
}


#define knameKey        @"Name"
#define kdetailsKey     @"Details"
#define kimageKey       @"Image"

- (void) encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:name forKey:knameKey];
    [encoder encodeObject:details forKey:kdetailsKey];
    [encoder encodeObject:image forKey:kimageKey];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    NSString *name = [decoder decodeObjectForKey:knameKey];
    NSString *details = [decoder decodeObjectForKey:kdetailsKey];
    UIImage *image = [decoder decodeObjectForKey:kimageKey];
    return [self initWithName:name details:details image:image];
}


@end
