//
//  WorkOutRoutePoint.h
//  WeWalk
//
//  Created by Zhuoxing Mao on 10/27/14.
//
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>
#import "CoreLocationController.h"

@interface WorkOutRoutePoint : NSObject
@property (nonatomic, strong) NSDate *timePoint;
@property (nonatomic, strong) MKUserLocation *userLocation;


-(NSTimeInterval) getTimeDiffInSecs: (WorkOutRoutePoint *) anotherPoint;

-(CLLocationDistance) getDistance: (WorkOutRoutePoint *) anotherPoint;

-(double) getAvgSpeed: (WorkOutRoutePoint *) anotherPoint;

@end
