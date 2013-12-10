//
//  MADViewController.m
//  scrabbleQ
//
//  Created by Emily Sayrs on 10/22/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
{
    NSArray *words;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSBundle *bundle = [NSBundle mainBundle];//returns a bundle object of our app
    NSString *plistPath = [bundle pathForResource:@"qwordswithoutu1" ofType:@"plist"];// reterive the path of continents.plist
    words=[[NSArray alloc] initWithContentsOfFile:plistPath];// loads the woeds of the plist file into the array
    self.title=@"Words";//sets the title of the controller
    
}

//required methods for UITableViewDataSource
//Customize the number of rows in the section
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [words count];// returns the number of continents 
}

//displays table view cells
-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
    //configure the cell
    cell.textLabel.text=[words objectAtIndex:indexPath.row];//sets the text of the cell with the row bing requested
    return cell;
}

//UITableViewDelegate method that is called when a row is selected
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *rowValue=[words objectAtIndex:indexPath.row];//sets the title of the selected row
    NSString *message = [[NSString alloc] initWithFormat:@"You Selected %@", rowValue];
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Row Selected" message:message delegate:nil cancelButtonTitle:@"Yes, I did" otherButtonTitles:nil];
    [alert show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//deselect the row that has been chosen 
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
