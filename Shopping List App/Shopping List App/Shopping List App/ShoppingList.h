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
    NSString *name;
    NSMutableArray *listItems;
    NSInteger rowNum;
    NSMutableArray *listItemObjects;
}

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *listItems;
@property (nonatomic, strong) NSMutableArray *listItemObjects;
@property NSInteger rowNum;


@end
