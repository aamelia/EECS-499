//
//  ShoppingList.h
//  Shopping List App
//
//  Created by Mia Atkinson on 3/6/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingList : NSObject
{
    NSString *owner;
    NSString *name;
    NSMutableArray *listItems;
}

@property (nonatomic, strong) NSString *owner;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *listItems;


@end
