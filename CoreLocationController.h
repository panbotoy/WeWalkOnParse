//
//  CoreLocationController.h
//  ParseStarterProject
//
//  Created by Stella Mao on 10/21/14.
//  This class is going to contain the logic we’ll nee to interface with Core Location
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol CoreLocationControllerDelegate
@required
- (void)update:(CLLocation *)location;
- (void)locationError:(NSError *)error;
@end

//implement a delegate so that we can get triggered when the location changes
@interface CoreLocationController : NSObject <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) id delegate;

@end
