//
//  MADViewController.m
//  music
//
//  Created by Emily Sayrs on 10/3/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *array=[[NSArray alloc] initWithObjects:@"Country", @"pop", @"Rock", @"Alternative", @"Hip Hop", @"Jazz", @"Classical", nil];
    _genre=array;
    NSArray *array2=[[NSArray alloc] initWithObjects:@"1950s", @"1960s", @"1970s", @"1980s", @"1990s", @"2000s", @"2010s", nil];
    _decade=array2;
}

//methods to implment the picker
//required for the UIPickerViewDataSource protocol
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
return 2; //number of components
}
//required for the UIPickerViewDataSource protcol
-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component==0)
    return[_genre count];//returns the number of rows data
    else return[_decade count];
           
}
//picker delegate methods
//returns the title for a given row
-(NSString*)pickerView:(UIPickerView*)pickerView
            titleForRow:(NSInteger)row
            forComponent:(NSInteger) component{
    if(component==0)
                return[_genre objectAtIndex:row];//returns the content of the row
    else return[_decade objectAtIndex:row];
            }
//called when a row is selected
-(void)pickerView:(UIPickerView *)pickerView
                 didSelectRow:(NSInteger)row
            inComponent:(NSInteger)component{
    NSInteger genreRow=[_musicPicker selectedRowInComponent:0];
    NSInteger decadeRow=[_musicPicker selectedRowInComponent:1];
    
    
                //writes the string with the row's content to the label
    _choiceLabel.text=[NSString stringWithFormat:@"You like %@ from the %@", [_genre objectAtIndex:genreRow], [_decade objectAtIndex:decadeRow]];
    
            }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
