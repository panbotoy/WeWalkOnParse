//
//  WorkOutRoute.h
//  WeWalk
//
//  Created by Zhuoxing Mao on 10/27/14.
//
//

#import <Foundation/Foundation.h>

#import "WorkOutRoutePoint.h"

@interface WorkOutRoute : NSObject

@property (nonatomic) double speed;
@property (nonatomic) double distance;
@property (nonatomic) BOOL testMode;
@property (nonatomic) NSTimeInterval totalTime;

@property (nonatomic, strong) NSMutableArray *workOutPoints;

-(void) addWorkOutPoint: (WorkOutRoutePoint *) point;
-(double) getAvgSpeed;

@end
