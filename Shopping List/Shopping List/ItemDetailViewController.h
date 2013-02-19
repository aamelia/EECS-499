//
//  ItemDetailViewController.h
//  Shopping List
//
//  Created by Mia Atkinson on 2/19/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemDetailViewController : UIViewController
{
    NSString *itemName;
    NSString *itemDetail;
}

@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, strong) NSString *itemDetail;
@property (strong, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *itemDetailLabel;

@end
