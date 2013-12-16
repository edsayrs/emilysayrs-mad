//
//  Record.h
//  scoreKeep2
//
//  Created by Emily Sayrs on 12/16/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Record : NSManagedObject

@property (nonatomic, retain) NSString * player1name;
@property (nonatomic, retain) NSString * player2name;
@property (nonatomic, retain) NSString * player1score;
@property (nonatomic, retain) NSString * player2score;
@property (nonatomic, retain) NSString * winner;
@property (nonatomic, retain) NSString * gameType;


@end
