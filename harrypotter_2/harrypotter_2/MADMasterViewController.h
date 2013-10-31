//
//  MADMasterViewController.h
//  harrypotter_2
//
//  Created by Emily Sayrs on 10/31/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MADDetailViewController;

@interface MADMasterViewController : UITableViewController

@property (strong, nonatomic) MADDetailViewController *detailViewController;
@property (copy, nonatomic) NSArray *characters;


@end
