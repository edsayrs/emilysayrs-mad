//
//  scoreKeeper.m
//  scoreKeep2
//
//  Created by Emily Sayrs on 10/1/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import "scoreKeeper.h"

@implementation scoreKeeper
-(id)initWithName:(NSString *)name  winner:(NSString *)winner gameType:(NSString *)gameType player1Name:(NSString *)player1Name player2Name:(NSString*)player2Name player1Score:(NSString*)player1Score player2Score:(NSString*)player2Score 
{
    self = [super init];
    if(self){
        _name= name;
        _winner= winner;
         _gameType= gameType;
        _player1Name= player1Name;
        _player2Name= player2Name;
        _player1Score= player1Score;
        _player2Score= player2Score;
      
        
        
        return self;
        
    }
    return nil;
}

@end
