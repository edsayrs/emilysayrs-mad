//
//  MADViewController.h
//  helloworldMAD
//
//  Created by Emily Davis Sayrs on 8/29/13.
//  Copyright (c) 2013 Emily Davis Sayrs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *messageText;

- (IBAction)buttonPressed:(UIButton *)sender;
@end
