//
//  MADViewController.h
//  sportimage
//
//  Created by Emily Sayrs on 9/10/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
- (IBAction)buttonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *sportimage;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
- (IBAction)textFieldDoneEditing:(UITextField *)sender;

@end
