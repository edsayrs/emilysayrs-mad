//
//  CAPYellowChildViewController.h
//  ThesisApp
//
//  Created by Emily Sayrs on 12/8/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAPYellowChildViewController : UIViewController
@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) IBOutlet UILabel *screenNumber;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIImageView *overlay;
@property (weak, nonatomic) IBOutlet UIImageView *overlay2;
@property (weak, nonatomic) IBOutlet UIImageView *overlay3;

@end
