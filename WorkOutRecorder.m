//
//  WorkOutRecorder.m
//  WeWalk
//
//  Created by Zhuoxing Mao on 10/27/14.
//
//

#import "WorkOutRecorder.h"

@interface WorkOutRecorder()

@property(nonatomic, strong) WorkOutRoute *currentRoute;

@end

@implementation WorkOutRecorder

-(void)startRecordRoute{
    self.currentRoute = [[WorkOutRoute alloc] init];
}

-(void)stopRecordRoute {
    
}

-(void) cancelCurrentRecording {
    
}

-(WorkOutRoute *)getCurrentRoute {
    return self.currentRoute;
}

@end