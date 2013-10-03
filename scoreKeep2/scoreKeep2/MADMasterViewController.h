//
//  MADMasterViewController.h
//  scoreKeep2
//
//  Created by Emily Sayrs on 10/1/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class scoreKeeperDataController;

@interface MADMasterViewController: UITableViewController

@property(strong,nonatomic)scoreKeeperDataController *dataController;

-(IBAction)done:(UIStoryboardSegue *)segue;
-(IBAction)cancel:(UIStoryboardSegue *)segue;
@end
