//
//  Item.h
//  Shopping List App
//
//  Created by Mia Atkinson on 3/21/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
{
    NSString *name;
    NSString *details;
    UIImage *image;
    NSInteger rowNum;
}

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *details;
@property (nonatomic, strong) UIImage *image;
@property NSInteger rowNum;

@end
