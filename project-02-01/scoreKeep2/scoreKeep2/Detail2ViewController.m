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
@property(strong, nonatomic) scoreKeeper *keeper;
@property(weak, nonatomic) IBOutlet UILabel *scoreNameLabel;
@property(weak, nonatomic) IBOutlet UILabel *winnerLabel;
@property(weak, nonatomic) IBOutlet UILabel *gameTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *player1NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *player2NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *player1ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *player2ScoreLabel;

- (IBAction)player1Plus5:(UIButton *)sender;

- (IBAction)player2Plus5:(UIButton *)sender;
- (IBAction)player1Plus10:(UIButton *)sender;
- (IBAction)player2Plus10:(UIButton *)sender;

@end