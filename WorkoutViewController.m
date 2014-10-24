//
//  WorkoutViewController.m
//  ParseStarterProject
//
//  Created by Stella Mao on 10/21/14.
//
//

#import "WorkoutViewController.h"

@interface WorkoutViewController ()


@end

@implementation WorkoutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.workoutMap.showsUserLocation = YES;
    self.locationController = [[CoreLocationController alloc] init];
	self.locationController.delegate = self;
	[self.locationController.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)update:(CLLocation *)location {
    self.lblLatitude.text= [NSString stringWithFormat:@"Latitude: %f", [location coordinate].latitude];
    self.lblLongitude.text = [NSString stringWithFormat:@"Longitude: %f", [location coordinate].longitude];
}

- (void)locationError:(NSError *)error {
    self.lblLatitude.text = [error description];
    self.lblLongitude.text = nil;
}

- (IBAction)onTestButtonClicked:(id)sender {
    NSLog(@"Happy Testing!");
    
    CLLocationCoordinate2D _srcCoord = CLLocationCoordinate2DMake(37.7833,-122.4167);
    MKPlacemark *_srcMark = [[MKPlacemark alloc] initWithCoordinate:_srcCoord addressDictionary:nil];
    MKMapItem *_srcItem = [[MKMapItem alloc] initWithPlacemark:_srcMark];
    
    
    CLLocationCoordinate2D _dstCoord = CLLocationCoordinate2DMake(34.0500,-118.2500);
    MKPlacemark *_dstMark = [[MKPlacemark alloc] initWithCoordinate:_dstCoord addressDictionary:nil];
    MKMapItem *_dstItem = [[MKMapItem alloc] initWithPlacemark:_dstMark];
    [self findDirectionsFrom: _srcItem to: _dstItem];
}


-(void)findDirectionsFrom:(MKMapItem*)source
                       to:(MKMapItem*)destination
{
    //provide loading animation here
    
    MKDirectionsRequest*request=[[MKDirectionsRequest alloc] init];
    request.source=source;
    request.transportType=MKDirectionsTransportTypeAutomobile;
    request.destination=destination;
    MKDirections*directions=[[MKDirections alloc] initWithRequest:request];
    //__blocktypeof(self)weakSelf=self;
    [directions calculateDirectionsWithCompletionHandler:
     ^(MKDirectionsResponse*response,NSError*error){
         
         //stop loading animation here
         
         if(error){
             NSLog(@"Error is %@",error);
         }else{
             //do something about the response, like draw it on map
             MKRoute* route = response.routes.firstObject;
             [self.workoutMap addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
         }
     }];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
