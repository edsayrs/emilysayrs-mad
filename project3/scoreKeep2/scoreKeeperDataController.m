//
//  scoreKeeperDataController.m
//  scoreKeep2
//
//  Created by Emily Sayrs on 10/1/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import "scoreKeeperDataController.h"
#import "scoreKeeper.h"

@interface scoreKeeperDataController ()
-(void) initializeDefaultDataList;
@end

@implementation scoreKeeperDataController

-(void)initializeDefaultDataList{
    NSMutableArray *keeperList=[[NSMutableArray alloc] init];
    self.masterScoreKeeperList= keeperList;
    /*scoreKeeper *keeper;
    keeper =[[scoreKeeper alloc]initWithName:@"Player1 vs Player2"  winner:@"Player1"gameType:@"dominos"];
    [self addScoreKeeperWithKeeper:keeper];*/
    //I commented this out so no default shows.
    
}

-(void)setMasterScoreKeeperList:(NSMutableArray *)newList{
    if(_masterScoreKeeperList !=newList) {
        _masterScoreKeeperList = [newList mutableCopy];
    }
}

-(id)init{
    if(self = [super init]){
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}
-(NSUInteger)countOfList{
    return [self.masterScoreKeeperList count];
}
-(scoreKeeper *) objectInListAtIndex:(NSUInteger)theIndex{
    return [self.masterScoreKeeperList objectAtIndex:theIndex];
}
-(void)addScoreKeeperWithKeeper:(scoreKeeper *)keeper{
    [self.masterScoreKeeperList addObject:keeper];
}
@end 
