//
//  MADSecondViewController.m
//  boulder
//
//  Created by Emily Sayrs on 10/17/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import "MADSecondViewController.h"

@interface MADSecondViewController ()

@end

@implementation MADSecondViewController

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

-(IBAction)submitQuestion:(UIButton *)sender{
    //dismisses the keyboard by using resignFirstResponder regardless of which field is the first responder.
    //http://stackoverflow.com/questions/1823317/get-the-current-first-responder-without-using-a-private-api
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    //mailto syntax: mailto:first@example.com?cc=second@example.com,third@example.com&subject=something&body=the body
    //Mailto parameter should be preceded by “?” for the first or only parameter and “&” for second and subsequent parameter

    NSString *recipients=@"mailto:edsayrs@gmail.comsubject=Question from boulder app";
        NSString *body =[NSString stringWithFormat:@"&body=%@ from %@ %@", _questionTextView.text, _nameTextField.text, _emailTextField.text];
    NSString *email=[NSString stringWithFormat:@"%@%@", recipients, body];
    NSLog(email);
    email= [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
    
    [[UIApplication sharedApplication]
     sendAction:@selector(resignFirstResponder) to:nil from:nil
     forEvent:nil];
    }


@end
