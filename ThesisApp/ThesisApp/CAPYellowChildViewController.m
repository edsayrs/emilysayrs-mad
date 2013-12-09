//
//  CAPYellowChildViewController.m
//  ThesisApp
//
//  Created by Emily Sayrs on 12/8/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import "CAPYellowChildViewController.h"

@interface CAPYellowChildViewController ()

@end

@implementation CAPYellowChildViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if(self.index ==0){
        
        self.backgroundImage.image = [UIImage imageNamed:@"page1.png"];
        
    }

    if(self.index ==1){
   
        self.overlay.image = [UIImage imageNamed:@"psychological-burnout.png"];
    }
    if(self.index ==2){
        self.backgroundImage.image = [UIImage imageNamed:@"anxiety-safe4.png"];   
    }
         
    if(self.index ==3){
        self.backgroundImage.image = [UIImage imageNamed:@"page2.png"];
    }
    if(self.index ==4){
        self.backgroundImage.image = [UIImage imageNamed:@"page3.png"];
    }
    if(self.index ==5){
        self.backgroundImage.image = [UIImage imageNamed:@"page4.png"];
    }
    if(self.index ==6){
        self.backgroundImage.image = [UIImage imageNamed:@"page5.png"];
    }
    if(self.index ==7){
        self.overlay.image = [UIImage imageNamed:@"psychological-burnout.png"];
        self.overlay2.image = [UIImage imageNamed:@"cewb.png"];
    }
    if(self.index ==8){
        self.backgroundImage.image = [UIImage imageNamed:@"relationships.png"];
    }
    if(self.index ==9){
        self.backgroundImage.image = [UIImage imageNamed:@"page6.png"];
    }
    if(self.index ==10){
        self.backgroundImage.image = [UIImage imageNamed:@"page7-1.png"];
    }
    if(self.index ==11){
        self.backgroundImage.image = [UIImage imageNamed:@"page8.png"];
    }
    if(self.index ==12){
        self.backgroundImage.image = [UIImage imageNamed:@"page9.png"];
    }
    if(self.index ==13){
        self.overlay.image = [UIImage imageNamed:@"psychological-burnout.png"];
        self.overlay2.image = [UIImage imageNamed:@"cewb.png"];
         self.overlay3.image = [UIImage imageNamed:@"disruptions-in-sleep.png"];
    }
    if(self.index ==14){
        self.backgroundImage.image = [UIImage imageNamed:@"sleep.png"];
    }
    if(self.index ==15){
        self.backgroundImage.image = [UIImage imageNamed:@"page10-1.png"];
    }
    if(self.index ==16){
        self.backgroundImage.image = [UIImage imageNamed:@"page11-1.png"];
    }
    if(self.index ==17){
        self.backgroundImage.image = [UIImage imageNamed:@"page12.png"];
    }
    if(self.index ==18){
        self.backgroundImage.image = [UIImage imageNamed:@"page13.png"];
    }
    if(self.index ==19){
        self.backgroundImage.image = [UIImage imageNamed:@"last-page-1.png"];
    }
    if(self.index ==20){
        self.backgroundImage.image = [UIImage imageNamed:@"cite.png"];
    }














    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
