//
//  MADViewController.m
//  beatles-lab3
//
//  Created by Emily Sayrs on 9/17/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    _imageControl.selectedSegmentIndex = -1;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//method to change the image. 
- (IBAction)changeImage:(UISegmentedControl *)sender {
    [self updateImage];
    [self updateCaps];
}

//fix caps glitch

-(void)updateImage {
    if(_imageControl.selectedSegmentIndex==0){
        _titleLabel.text=@"Young Beatles";
        _beatlesImage.image=[UIImage imageNamed:@"beatles1.png"];
    }else if (_imageControl.selectedSegmentIndex==1){
        _titleLabel.text=@"Not so young Beatles";
        _beatlesImage.image=[UIImage imageNamed:@"beatles2.png"];
    }
}

- (void)updateCaps{
    if (_capitalizedSwich.on){
        _titleLabel.text=[_titleLabel.text uppercaseString];
    
    }else{
        _titleLabel.text=[_titleLabel.text lowercaseString];
    }
}


- (IBAction)changeFontSize:(UISlider *)sender {
    //get font size
    int fontSize = sender.value;
    //change the label displayed on the label- need to change into a string
    _fontSizeNumberLabel.text=[NSString stringWithFormat: @"Font size:"@"%d", fontSize];
    //create new font object
    UIFont *newFont = [UIFont systemFontOfSize:sender.value];
    //apply the new font to the label
    _titleLabel.font=newFont;
}


- (IBAction)updateFont:(UISwitch *)sender {
    [self updateCaps];
}


@end
