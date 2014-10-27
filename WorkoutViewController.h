//
//  WorkoutViewController.h
//  ParseStarterProject
//
//  Created by Stella Mao on 10/21/14.
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CoreLocationController.h"

@interface WorkoutViewController : UIViewController <CoreLocationControllerDelegate, MKMapViewDelegate>
@property (nonatomic, retain) CoreLocationController *locationController;
@property (strong, nonatomic) IBOutlet MKMapView *workoutMap;
@property (strong, nonatomic) IBOutlet UILabel *lblLatitude;
@property (strong, nonatomic) IBOutlet UILabel *lblLongitude;
@property (weak, nonatomic) IBOutlet UIButton *TestButton;
@end
