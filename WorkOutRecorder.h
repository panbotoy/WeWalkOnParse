//
//  WorkOutRecorder.h
//  WeWalk
//
//  Created by Zhuoxing Mao on 10/27/14.
//
//

#import <Foundation/Foundation.h>
#import "WorkOutRoute.h"

@interface WorkOutRecorder : NSObject
-(void)startRecordRoute;
-(void)stopRecordRoute;
-(WorkOutRoute *)getCurrentRoute;
-(void) cancelCurrentRecording;
@end
