//
//  MADViewController.m
//  helloworldMAD
//
//  Created by Emily Davis Sayrs on 8/29/13.
//  Copyright (c) 2013 Emily Davis Sayrs. All rights reserved.
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
    _messageText.text=@"Hello World";
    
}
@end
