//
//  Detail2ViewController.m
//  scoreKeep2
//
//  Created by Emily Sayrs on 10/31/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import "Detail2ViewController.h"
#import "scoreKeeper.h"


@interface  Detail2ViewController()
-(void)configureView;
@end

@implementation Detail2ViewController

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
    scoreKeeper *theKeeper2 = self.keeper;
    
    if(theKeeper2){
        self.scoreNameLabel.text = theKeeper2.name;
        self.winnerLabel.text = theKeeper2.winner;
        self.gameTypeLabel.text = theKeeper2.gameType;
        self.player1NameLabel.text = theKeeper2.player1Name;
        self.player2NameLabel.text = theKeeper2.player2Name;
        self.player1ScoreLabel.text =theKeeper2.player1Score;
        self.player2ScoreLabel.text =theKeeper2.player1Score;
     

        
    }
    
}

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

-(void)updatePlayer1Plus1{
    int player1CurrentScore=[_player1ScoreLabel.text intValue];
    int player1CurrentBags=[_player1BagsLabel.text intValue];
    if(player1CurrentScore <500){
        if(player1CurrentBags<9){
            player1CurrentScore= player1CurrentScore+1;
            player1CurrentBags = player1CurrentBags+1;
        }
        else {
            player1CurrentScore=player1CurrentScore-100;
            player1CurrentBags=0;
        }
    }
    else {
        self.winnerLabel.text=_player1NameLabel.text;
        player1CurrentScore=500;
        //check to see if the user is signed into facebook//
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
            detail2SLComposerSheet = [[SLComposeViewController alloc] init];
            detail2SLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            [detail2SLComposerSheet setInitialText:[NSString stringWithFormat:@"I just beat %@ %@ to %@ in a game of %@!", _player2NameLabel.text, _player1ScoreLabel.text, _player2ScoreLabel.text, self.gameTypeLabel.text]];
            
            [self presentViewController:detail2SLComposerSheet animated:YES completion:nil];
        }
        
        [detail2SLComposerSheet setCompletionHandler:^
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
    
    _player1BagsLabel.text=[noStyle stringFromNumber:[NSNumber numberWithInt:player1CurrentBags]];
}

-(void)updatePlayer1Plus10{
    int player1CurrentScore=[_player1ScoreLabel.text intValue];
    if(player1CurrentScore <=490){
        player1CurrentScore= player1CurrentScore+10;
    }
    else {
        self.winnerLabel.text=_player1NameLabel.text;
        player1CurrentScore=500;
        
        //check to see if the user is signed into facebook//
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
            detail2SLComposerSheet = [[SLComposeViewController alloc] init];
            detail2SLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            [detail2SLComposerSheet setInitialText:[NSString stringWithFormat:@"I just beat %@ %@ to %@ in a game of %@!", _player2NameLabel.text, _player1ScoreLabel.text, _player2ScoreLabel.text, self.gameTypeLabel.text]];
            
            [self presentViewController:detail2SLComposerSheet animated:YES completion:nil];
        }
        
        [detail2SLComposerSheet setCompletionHandler:^
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

-(void)updatePlayer2Plus1{
    int player2CurrentScore=[_player2ScoreLabel.text intValue];
    int player2CurrentBags=[_player2BagsLabel.text intValue];
    if(player2CurrentScore <500){
        if(player2CurrentBags<9){
           player2CurrentScore= player2CurrentScore+1;
            player2CurrentBags = player2CurrentBags+1;
        }
        else {
            player2CurrentScore=player2CurrentScore-100;
            player2CurrentBags=0;
        }
    }
    else {
        self.winnerLabel.text=_player2NameLabel.text;
        //check to see if the user is signed into facebook//
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
            detail2SLComposerSheet = [[SLComposeViewController alloc] init];
            detail2SLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            [detail2SLComposerSheet setInitialText:[NSString stringWithFormat:@"I just beat %@ %@ to %@ in a game of %@!", _player1NameLabel.text, _player2ScoreLabel.text, _player1ScoreLabel.text, self.gameTypeLabel.text]];
            
            [self presentViewController:detail2SLComposerSheet animated:YES completion:nil];
        }
        
        [detail2SLComposerSheet setCompletionHandler:^
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
    
         _player2BagsLabel.text=[noStyle stringFromNumber:[NSNumber numberWithInt:player2CurrentBags]];
}
-(void)updatePlayer2Plus10{
    int player2CurrentScore=[_player2ScoreLabel.text intValue];
    if(player2CurrentScore <=490){
        player2CurrentScore= player2CurrentScore+10;
    }
    else {
        self.winnerLabel.text=_player2NameLabel.text;
        player2CurrentScore=500;
        
        //check to see if the user is signed into facebook//
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
            detail2SLComposerSheet = [[SLComposeViewController alloc] init];
            detail2SLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            [detail2SLComposerSheet setInitialText:[NSString stringWithFormat:@"I just beat %@ %@ to %@ in a game of %@!", _player1NameLabel.text, _player2ScoreLabel.text, _player1ScoreLabel.text, self.gameTypeLabel.text]];
            
            [self presentViewController:detail2SLComposerSheet animated:YES completion:nil];
        }
        
        [detail2SLComposerSheet setCompletionHandler:^
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


- (IBAction)player1Plus1:(UIButton *)sender {
    [self updatePlayer1Plus1];
    
}

- (IBAction)player2Plus1:(UIButton *)sender {
    [self updatePlayer2Plus1];
}

- (IBAction)player1Plus10:(UIButton *)sender {
    [self updatePlayer1Plus10];
}

- (IBAction)player2Plus10:(UIButton *)sender {
    [self updatePlayer2Plus10];
}



@end 