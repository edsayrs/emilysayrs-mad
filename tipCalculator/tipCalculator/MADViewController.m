//
//  MADViewController.m
//  tipCalculator
//
//  Created by Emily Davis Sayrs on 9/25/13.
//  Copyright (c) 2013 Emily Davis Sayrs. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //set the controller as the delegate for each UITextField instance
    _checkAmount.delegate=self;
    _tipPercent.delegate=self;
    _people.delegate=self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//implement the UITextFieldDelegate methods
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //textFieldShouldReturn is send to the UITextField's delegate when the return button on the keyboard is pressed. 
    [textField resignFirstResponder];
    return YES;
}

-(void)updateTipTotals{
    //get values from the text fields
    float amount=[_checkAmount.text floatValue];
    float pct=[_tipPercent.text floatValue];
    int numberOfPeople=[_people.text intValue];
    
    pct=pct/100;//converts percent to a fraction
    //compute totals:
    float tip=amount*pct;
    float total=amount+tip;
    float personTotal=0;
    //take care of the devide by 0 error:
    if (numberOfPeople>0)
        {
            personTotal=total/numberOfPeople;
        }
    //add else statement to show alert if number of people is 0
    else{
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"Hey, stupid," message:@"You cant divide a check by 0 people!" delegate:self cancelButtonTitle:@"I'll fix it" otherButtonTitles:@"I meant 1", nil];
        [alertView show];

    }
    //use NSNumberFormatter to set the formal style to currency
    NSNumberFormatter *currencyFormatter=[[NSNumberFormatter alloc]init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    //update all labels, stringFormNumber generates strings
    
    _tipDue.text=[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:tip]];
    _totalDue.text=[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:total]];
    _totalDuePerPerson.text=[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:personTotal]];
}
-(void) textFieldDidEndEditing:(UITextField *) textField
{
    [self updateTipTotals];
}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if(buttonIndex==1)
    {
        _people.text=[NSString stringWithFormat:@"1"];
    }
}

@end
