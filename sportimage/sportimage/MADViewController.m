//
//  MADViewController.m
//  sportimage
//
//  Created by Emily Sayrs on 9/10/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    
    if(sender.tag==1)
    {
        _sportimage.image=[UIImage imageNamed:@"home-bg-Glass.png"];
        NSString *message = [[NSString alloc] initWithFormat:@"%@ Thanks for helping out!", _nameField.text];
        _messageLabel.text=message;
    }
    
    if(sender.tag==2)
    {
        _sportimage.image=[UIImage imageNamed:@"home-bg-GlassSpill.png"];
        NSString *message = [[NSString alloc] initWithFormat:@"Look what a mess you made %@", _nameField.text];
        _messageLabel.text=message;
        
    }
}

- (IBAction)textFieldDoneEditing:(UITextField *)sender {
    [sender resignFirstResponder];
}
@end
