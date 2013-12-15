//
//  scoreKeeperDataController.h
//  scoreKeep2
//
//  Created by Emily Sayrs on 10/1/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import <Foundation/Foundation.h>
@class scoreKeeper;

@interface scoreKeeperDataController : NSObject

@property(nonatomic, copy) NSMutableArray *masterScoreKeeperList;

-(NSUInteger)countOfList;
-(scoreKeeper *) objectInListAtIndex: (NSUInteger)theIndex;
-(void)addScoreKeeperWithKeeper:(scoreKeeper *)keeper;

@end
