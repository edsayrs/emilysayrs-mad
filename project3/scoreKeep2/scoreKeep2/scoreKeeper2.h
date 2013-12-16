//
//  scoreKeeper2.h
//  scoreKeep2
//
//  Created by Emily Sayrs on 11/12/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface scoreKeeper2 : NSObject
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *winner;
@property(nonatomic, copy) NSString *gameType;
@property(nonatomic, copy) NSString *player1Name;
@property(nonatomic, copy) NSString *player2Name;
@property(nonatomic, copy) NSString *player1Score;
@property(nonatomic, copy) NSString *player2Score;
@property(nonatomic, copy) NSString *player1Bags;
@property(nonatomic, copy) NSString *player2Bags;


-(id)initWithName:(NSString *)name  winner:(NSString *)winner gameType:(NSString *)gameType player1Name:(NSString *)player1Name player2Name:(NSString*)player2Name player1Score:(NSString*)player1Score player2Score:(NSString*)player2Score player1Bags:(NSString*)player1Bags player2Bags:(NSString*)player2Bags  ;

@end
