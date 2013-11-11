//
//  MADMasterViewController.m
//  scoreKeep2
//
//  Created by Emily Sayrs on 10/1/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//set up for multiple views and table view inspired from "your secome ios app:storyboards from developer.apple.com. url:https://developer.apple.com/library/ios/documentation/iPhone/Conceptual/SecondiOSAppTutorial/SecondiOSAppTutorial.pdf


#import "MADMasterViewController.h"

#import "MADDetailViewController.h"
#import "scoreKeeperDataController.h"
#import "scoreKeeper.h"
#import "AddKeeperViewController.h"
#import "Detail2ViewController.h"
#import "Detail2ViewController.m"


/*@interface MADMasterViewController () {
    NSMutableArray *_objects;
}
@end*/

@implementation MADMasterViewController


-(IBAction)done:(UIStoryboardSegue *)segue {
    if([[segue identifier] isEqualToString:@"ReturnInput"]){
        AddKeeperViewController *addController = [segue sourceViewController];
        if(addController.scoreKeeper){
            [self.dataController addScoreKeeperWithKeeper:addController.scoreKeeper];
            [[self tableView] reloadData];
        }
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

-(IBAction)cancel:(UIStoryboardSegue*)segue{
    if([[segue identifier] isEqualToString:@"CancelInput"]){
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.dataController=[[scoreKeeperDataController alloc]init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   /* self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}*/

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"scoreKeeperCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    scoreKeeper *keeperAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
  
    [[cell textLabel]setText:keeperAtIndex.name];
    
    [[cell detailTextLabel] setText:keeperAtIndex.gameType];
   
     return cell;
        

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

/*- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}*/

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

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
UITableViewCell *cell =[tableView cellForRowAtIndexPath:indexPath];


if([cell.detailTextLabel.text isEqualToString:@"Dominos"]){
    [self performSegueWithIdentifier:@"ShowKeeperDetails" sender:nil];
    
} else{
     [self performSegueWithIdentifier:@"ShowKeeper2Details" sender:nil];
    
    }
}
    

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowKeeperDetails"]) {
        MADDetailViewController *detailViewController = [segue destinationViewController];
        
        detailViewController.keeper = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
        
    
    }
else{
    MADDetailViewController *detail2ViewController =[segue destinationViewController];
    detail2ViewController.keeper = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
}
}



@end

