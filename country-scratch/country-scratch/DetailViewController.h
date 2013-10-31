//
//  DetailViewController.h
//  country-scratch
//
//  Created by Emily Sayrs on 10/29/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property(strong, nonatomic) NSMutableArray *countryList;


@end
