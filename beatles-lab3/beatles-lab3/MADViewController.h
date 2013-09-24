//
//  MADViewController.h
//  beatles-lab3
//
//  Created by Emily Sayrs on 9/17/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *beatlesImage;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *imageControl;

@property (weak, nonatomic) IBOutlet UISwitch *capitalizedSwich;
@property (weak, nonatomic) IBOutlet UILabel *fontSizeNumberLabel;

- (IBAction)changeFontSize:(UISlider *)sender;

- (IBAction)updateFont:(UISwitch *)sender;
//action from on/off switch that changes the message in the picture label  

- (IBAction)changeImage:(UISegmentedControl *)sender;//action from segmented control swich that changes the image

@end
  