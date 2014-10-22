//
//  CoreLocationController.m
//  ParseStarterProject
//
//  Created by Stella Mao on 10/21/14.
//  This class is going to contain the logic we’ll nee to interface with Core Location
//

#import "CoreLocationController.h"

@implementation CoreLocationController
- (id)init {
	self = [super init];
	if(self != nil) {
		self.locationManager = [[CLLocationManager alloc] init];
		self.locationManager.delegate = self;
	}
	return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    [self.delegate update:newLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [self.delegate locationError:error];
}
@end
