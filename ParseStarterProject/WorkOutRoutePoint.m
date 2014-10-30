//
//  WorkOutRoutePoint.m
//  WeWalk
//
//  Created by Zhuoxing Mao on 10/27/14.
//
//

#import "WorkOutRoutePoint.h"

@implementation WorkOutRoutePoint

-(id) initWithUserLocation: (MKUserLocation *) userLocation {
    self.userLocation = userLocation;
    self.timePoint = [NSDate date];
    return self;
}

-(id) initWithUserLocation: (MKUserLocation *) userLocation AndTimePoint: (NSDate *) timePoint {
    self.userLocation = userLocation;
    self.timePoint = timePoint;
    return self;
}

-(NSTimeInterval) getTimeDiffInSecs: (WorkOutRoutePoint *) anotherPoint{
    return [self.timePoint timeIntervalSinceDate: anotherPoint.timePoint];
}

-(CLLocationDistance) getDistance: (WorkOutRoutePoint *) anotherPoint{
    return [self.userLocation.location distanceFromLocation: anotherPoint.userLocation.location];
}

-(double) getAvgSpeed: (WorkOutRoutePoint *) anotherPoint {
    return [self getDistance: anotherPoint] / [self getTimeDiffInSecs:anotherPoint];
}

@end
