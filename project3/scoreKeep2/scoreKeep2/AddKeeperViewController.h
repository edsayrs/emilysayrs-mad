//
//  AddKeeperViewController.h
//  scoreKeep2
//
//  Created by Emily Sayrs on 10/2/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class scoreKeeper;
@interface AddKeeperViewController : UITableViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *player1NameInput;
@property (weak, nonatomic) IBOutlet UITextField *player2NameInput;
@property (weak, nonatomic) IBOutlet UILabel *gameTypeInput;

@property (weak, nonatomic) IBOutlet UITextField *startingScoreValue;


@property(strong, nonatomic) scoreKeeper *scoreKeeper;

@property (weak, nonatomic) IBOutlet UIPickerView *gamePicker;
@property (strong, nonatomic) NSArray *games;


@end
