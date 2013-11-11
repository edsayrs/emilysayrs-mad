//
//  AddKeeperViewController.m
//  scoreKeep2
//
//  Created by Emily Sayrs on 10/2/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import "AddKeeperViewController.h"
#import "scoreKeeper.h"
#import"MADDetailViewController.h"

@interface AddKeeperViewController ()

@end

@implementation AddKeeperViewController

/*- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self; 
}*/
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if((textField == self.player1NameInput) || (textField == self.player2NameInput)){
        [textField resignFirstResponder];
    
    
    }
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSArray *array=[[NSArray alloc] initWithObjects:@"Dominos", @"Spades", nil];
    _games=array;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//methods to implement the picker
//required for the UIPickerViewDataCource protocol 
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;//number of components 
} 
//required for the UIPickerViewDataCource protocol 
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
        return[_games count];//returns the number of rows.
    
}

//picker delegate mathods
//returns the title of each row
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_games objectAtIndex:row];//returns the content of the row
    
}

//this is called when a row is selected
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSInteger gamesRow=[_gamePicker selectedRowInComponent:0];


//writes tge string with the rows content to the label
    _gameTypeInput.text=[_games objectAtIndex:gamesRow];
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"ReturnInput" ]){
        if([self.player1NameInput.text length] || [self.player2NameInput.text length] || [self.gameTypeInput.text length] ){
            scoreKeeper *keeper;
        
            keeper = [[scoreKeeper alloc]
                      initWithName:[[NSString alloc]initWithFormat:@"%@ vs. %@", _player1NameInput.text, _player2NameInput.text] winner:[[NSString alloc]initWithFormat:@"Undecided"] gameType:self.gameTypeInput.text player1Name:self.player1NameInput.text player2Name:self.player2NameInput.text player1Score:self.startingScoreValue.text player2Score:self.startingScoreValue.text];
            self.scoreKeeper = keeper;
        }
    }
    
}

#pragma mark - Table view data source

/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}*/

/*- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}*/

/*- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

/*- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     
}*/

@end
