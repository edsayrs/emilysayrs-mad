//
//  MADAnnotation.m
//  location
//
//  Created by Emily Sayrs on 11/21/13.
//  Copyright (c) 2013 Emily Sayrs. All rights reserved.
//

#import "MADAnnotation.h"

@implementation MADAnnotation

//initializes an annotation instance
-(id) initWithCoordinate:(CLLocationCoordinate2D)coor{
    _coordinate=coor;
    _title=@"You are here";
    _subtitle=[NSString stringWithFormat:@"Latitude: %f. Longitude: %f", _coordinate.latitude, _coordinate.longitude];
    return self;
}
//changes location of tha anotation
-(void) moveAnnotation:(CLLocationCoordinate2D)newCoordinate{
    [self willChangeValueForKey:@"coordinate"]; //informs the receiver that the coordinate is about to change.
    [self willChangeValueForKey:@"subtitle"];//informs the receiver that the subtitle is about to change.
    _coordinate = newCoordinate;
    _subtitle = [[NSString alloc] initWithFormat:@"Latitude: %f. Longitude: %f", _coordinate.latitude, _coordinate.longitude];
    [self didChangeValueForKey:@"coordinate"]; //informs the reciever that the coordinate has changed
    [self didChangeValueForKey:@"subtitle"]; //informs the receiver that the subtitle has changed.
}
@end
