//
//  MADDetailViewController.m
//  scoreKeep2
//
//  Created by Emily Sayrs on 10/1/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import "MADDetailViewController.h"
#import "scoreKeeper.h"
#import "Record.h"
#import "MADAppDelegate.h"

@interface MADDetailViewController ()
- (void)configureView;


@end

@implementation MADDetailViewController


#pragma mark - Managing the detail item

- (void)setKeeper:(scoreKeeper *)newKeeper
{
    if (_keeper != newKeeper) {
        _keeper = newKeeper;
        
 
        

        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    scoreKeeper *theKeeper = self.keeper;
    
    if(theKeeper){
        self.scoreNameLabel.text = theKeeper.name;
        self.winnerLabel.text = theKeeper.winner;
        self.gameTypeLabel.text = theKeeper.gameType;
        self.player1NameLabel.text = theKeeper.player1Name;
        self.player2NameLabel.text = theKeeper.player2Name;
        self.player1ScoreLabel.text =theKeeper.player1Score;
        self.player2ScoreLabel.text =theKeeper.player2Score;
        
    }
    
}
//-(void)viewWillAppear{
//  
//        // Update the user interface for the detail item.
//        scoreKeeper *theKeeper = self.keeper;
//        
//        if(theKeeper){
//            self.scoreNameLabel.text = theKeeper.name;
//            self.winnerLabel.text = theKeeper.winner;
//            self.gameTypeLabel.text = theKeeper.gameType;
//            self.player1NameLabel.text = theKeeper.player1Name;
//            self.player2NameLabel.text = theKeeper.player2Name;
//            self.player1ScoreLabel.text =theKeeper.player1Score;
//            self.player2ScoreLabel.text =theKeeper.player2Score;        
//    }
//
//}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)updatePlayer1Plus5{
    int player1CurrentScore=[_player1ScoreLabel.text intValue];
    if(player1CurrentScore <130){
        player1CurrentScore= player1CurrentScore+15;
    }
    else {
        self.winnerLabel.text=_player1NameLabel.text;
        player1CurrentScore=150;
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
            detailSLComposerSheet = [[SLComposeViewController alloc] init];
            detailSLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            [detailSLComposerSheet setInitialText:[NSString stringWithFormat:@"I just beat %@ %@ to %@ in a game of %@!", _player2NameLabel.text, _player2ScoreLabel.text, _player1ScoreLabel.text, self.gameTypeLabel.text]];
            
            [self presentViewController:detailSLComposerSheet animated:YES completion:nil];
        }
        
        [detailSLComposerSheet setCompletionHandler:^
         (SLComposeViewControllerResult result)  {
             NSString *output = [[NSString alloc] init];
            switch(result){
            case SLComposeViewControllerResultCancelled: output = @"Feeling Humble? Facebook Post Canceled";
                    break;
                case SLComposeViewControllerResultDone: output = @"Shout it out! Facebook post sucessful";
                    break;
                    
            default:
                break;
            }
             
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"facebook" message:output delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [alert show];
             
        }];

    }
    
    NSNumberFormatter *noStyle=[[NSNumberFormatter alloc]init];
    [noStyle setNumberStyle:NSNumberFormatterNoStyle];
    
    _player1ScoreLabel.text=[noStyle stringFromNumber:[NSNumber numberWithInt:player1CurrentScore]];
}
-(void)updatePlayer1Plus10{
    int player1CurrentScore=[_player1ScoreLabel.text intValue];
    if(player1CurrentScore <=135){
        player1CurrentScore= player1CurrentScore+10;
    }
    else {
        self.winnerLabel.text=_player1NameLabel.text;
         player1CurrentScore=150;
        
        //try to set up facebook sheet action here, rather than use a button//
        //check to see if the user is signed into facebook//
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
            detailSLComposerSheet = [[SLComposeViewController alloc] init];
            detailSLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            [detailSLComposerSheet setInitialText:[NSString stringWithFormat:@"I just beat %@ %@ to %@ in a game of %@!", _player2NameLabel.text, _player2ScoreLabel.text, _player1ScoreLabel.text, self.gameTypeLabel.text]];
            
            [self presentViewController:detailSLComposerSheet animated:YES completion:nil];
        }
        
        [detailSLComposerSheet setCompletionHandler:^
         (SLComposeViewControllerResult result)  {
             NSString *output = [[NSString alloc] init];
             switch(result){
                 case SLComposeViewControllerResultCancelled: output = @"Feeling Humble? Facebook Post Canceled";
                     break;
                 case SLComposeViewControllerResultDone: output = @"Shout it out! Facebook post sucessful";
                     break;
                     
                 default:
                     break;
             }
             
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"facebook" message:output delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [alert show];
             
         }];
        
    }
    
    NSNumberFormatter *noStyle=[[NSNumberFormatter alloc]init];
    [noStyle setNumberStyle:NSNumberFormatterNoStyle];

    _player1ScoreLabel.text=[noStyle stringFromNumber:[NSNumber numberWithInt:player1CurrentScore]];
}

-(void)updatePlayer2Plus5{
    int player2CurrentScore=[_player2ScoreLabel.text intValue];
    if(player2CurrentScore <130){
        player2CurrentScore= player2CurrentScore+15;
    }
    else {
        self.winnerLabel.text=_player2NameLabel.text;
         player2CurrentScore=150;
        //try to set up facebook sheet action here, rather than use a button//
        //check to see if the user is signed into facebook//
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
            detailSLComposerSheet = [[SLComposeViewController alloc] init];
            detailSLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            [detailSLComposerSheet setInitialText:[NSString stringWithFormat:@"I just beat %@ %@ to %@ in a game of %@!", _player1NameLabel.text, _player1ScoreLabel.text, _player2ScoreLabel.text, self.gameTypeLabel.text]];
            
            
            [self presentViewController:detailSLComposerSheet animated:YES completion:nil];
        }
        
        [detailSLComposerSheet setCompletionHandler:^
         (SLComposeViewControllerResult result)  {
             NSString *output = [[NSString alloc] init];
             switch(result){
                 case SLComposeViewControllerResultCancelled: output = @"Feeling Humble? Facebook Post Canceled";
                     break;
                 case SLComposeViewControllerResultDone: output = @"Shout it out! Facebook post sucessful";
                     break;
                     
                 default:
                     break;
             }
             
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"facebook" message:output delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [alert show];
             
         }];
        
    }
    
    NSNumberFormatter *noStyle=[[NSNumberFormatter alloc]init];
    [noStyle setNumberStyle:NSNumberFormatterNoStyle];
    
    _player2ScoreLabel.text=[noStyle stringFromNumber:[NSNumber numberWithInt:player2CurrentScore]];
}
-(void)updatePlayer2Plus10{
    int player2CurrentScore=[_player2ScoreLabel.text intValue];
    if(player2CurrentScore <=135){
        player2CurrentScore= player2CurrentScore+10;
    }
    else {
        self.winnerLabel.text=_player2NameLabel.text;
         player2CurrentScore=150;
        //try to set up facebook sheet action here, rather than use a button//
        //check to see if the user is signed into facebook//
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
            detailSLComposerSheet = [[SLComposeViewController alloc] init];
            detailSLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            [detailSLComposerSheet setInitialText:[NSString stringWithFormat:@"I just beat %@ %@ to %@ in a game of %@!", _player1NameLabel.text, _player1ScoreLabel.text, _player2ScoreLabel.text, self.gameTypeLabel.text]];
            
            [self presentViewController:detailSLComposerSheet animated:YES completion:nil];
        }
        
        [detailSLComposerSheet setCompletionHandler:^
         (SLComposeViewControllerResult result)  {
             NSString *output = [[NSString alloc] init];
             switch(result){
                 case SLComposeViewControllerResultCancelled: output = @"Feeling Humble? Facebook Post Canceled";
                     break;
                 case SLComposeViewControllerResultDone: output = @"Shout it out! Facebook post sucessful";
                     break;
                     
                 default:
                     break;
             }
             
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"facebook" message:output delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [alert show];
             
         }];
        
    }
    
    NSNumberFormatter *noStyle=[[NSNumberFormatter alloc]init];
    [noStyle setNumberStyle:NSNumberFormatterNoStyle];
    
    _player2ScoreLabel.text=[noStyle stringFromNumber:[NSNumber numberWithInt:player2CurrentScore]];
}


- (IBAction)player1Plus5:(UIButton *)sender {
    [self updatePlayer1Plus5];
    
}

- (IBAction)player2Plus5:(UIButton *)sender {
    [self updatePlayer2Plus5];
}

- (IBAction)player1Plus10:(UIButton *)sender {
    [self updatePlayer1Plus10];
}

- (IBAction)player2Plus10:(UIButton *)sender {
    [self updatePlayer2Plus10];
}
@end
