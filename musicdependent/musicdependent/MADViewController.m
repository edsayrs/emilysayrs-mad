//
//  MADViewController.m
//  musicdependent
//
//  Created by Emily Sayrs on 10/8/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSBundle *bundle=[NSBundle mainBundle];
    //creates an object called buncle of class NSBundle, but calling the method mainBundle on the NSBundle class
    NSString *plistPath=[bundle pathForResource:@"artistalbums" ofType:@"plist"];
    //use bundle to point to artistsalbums.plist, returns a string, which we are assigning to an object called plistPath. now we have an NSString that points to the plist.
    _artistAlbums=[[NSDictionary alloc] initWithContentsOfFile:plistPath];
    //allocate new dictionary, initalize with the contents of the file that is available at the string plsitPath. dictionary is called artist albums
    _artists=[_artistAlbums allKeys];
    //all keys are all the artists, get them and ssign them to the array artists.
    NSString *selectedArtist=[_artists objectAtIndex:0];
    //get the artist at index 0
    _albums =[_artistAlbums objectForKey:selectedArtist];
    //get the albums for the selected artist and populate the right component 
    
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;//number of components 
}

//required for datasource protocol
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component==artistComponent) //whichs which component was picked and returns that components row count
        return[_artists count];
    else return[_albums count];
}
//picker delegate methods
//returns the title of a given row
-(NSString *)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger) row forComponent:(NSInteger) component{
    if(component==artistComponent)
        //checks which component was picked and returns the value for that component
        return[_artists objectAtIndex:row];
    else return [_albums objectAtIndex:row];
    
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component==artistComponent){
        NSString *selectedArtist=[_artists objectAtIndex:row];
        _albums=[_artistAlbums objectForKey:selectedArtist];
        [_musicPicker selectRow:0 inComponent:albumComponent animated:YES];
        [_musicPicker reloadComponent:albumComponent];
    }
    NSInteger artistrow=[_musicPicker selectedRowInComponent:artistComponent];
                         NSInteger albumrow=[_musicPicker selectedRowInComponent:albumComponent];
                         _choiceLabel.text=[NSString stringWithFormat:@"You like %@ by %@", [_albums objectAtIndex:albumrow], [_artists objectAtIndex:artistrow]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
