//
//  scoreKeeper2DataController.h
//  scoreKeep2
//
//  Created by Emily Sayrs on 11/9/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import <Foundation/Foundation.h>
@class scoreKeeper2;

@interface scoreKeeper2DataController : NSObject
@property(nonatomic, copy) NSMutableArray *masterScoreKeeperList;

-(NSUInteger)countOfList;
-(scoreKeeper2 *) objectInListAtIndex: (NSUInteger)theIndex;
-(void)addScoreKeeperWithKeeper:(scoreKeeper2 *)keeper2;


@end
