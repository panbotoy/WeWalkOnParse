//
//  WorkOutRoute.m
//  WeWalk
//
//  Created by Zhuoxing Mao on 10/27/14.
//
//

#import "WorkOutRoute.h"

@implementation WorkOutRoute

-(id) init {
    self = [super init];
    return self;
}

-(id) initWithOriginPoint : (WorkOutRoutePoint *) point {
    [self.workOutPoints addObject: point];
    return self;
}

-(void) addWorkOutPoint: (WorkOutRoutePoint *) point {
    if (self.workOutPoints.count == 0){
        [self.workOutPoints addObject:point];
    } else {
        WorkOutRoutePoint *last = self.workOutPoints.lastObject;
        self.totalTime += [last getTimeDiffInSecs: point];
        self.distance += [last getDistance:point];
    }

}
-(double) getAvgSpeed {
    if (self.workOutPoints.count <= 1) {  // if there is only 1 or 0 points, don't calculate speed
        NSLog(@"[WorkOutRoute.m][Only 0 or 1 point in route, cannot calculate speed!]");
        return DBL_MIN;
    } else {
        return self.distance / self.totalTime ;
    }
}

@end
