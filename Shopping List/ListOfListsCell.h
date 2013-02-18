//
//  ListOfListsCell.h
//  Shopping List
//
//  Created by Mia Atkinson on 2/17/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListOfListsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ListImage;
@property (weak, nonatomic) IBOutlet UILabel *ListNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *OwnerLabel;
@end
