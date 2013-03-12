//
//  DataModel.h
//  Checklists
//
//  Created by Matthijs Hollemans on 03-06-12.
//  Copyright (c) 2012 Hollance. All rights reserved.
//

#import <Foundation/Foundation.h>
 
@interface DataModel : NSObject
 
@property (nonatomic, strong) NSMutableArray *lists;
 
- (void)saveChecklists;
- (int)indexOfSelectedChecklist;
- (void)setIndexOfSelectedChecklist:(int)index;
- (void)sortChecklists;

@end
