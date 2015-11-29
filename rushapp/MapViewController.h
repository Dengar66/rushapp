//
//  MapViewController.h
//  rushapp
//
//  Created by Paul Hurlbut on 11/28/15.
//  Copyright © 2015 Paul Hurlbut. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

//IBOutlet MKMapView *mapView;

@interface MapViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate> {
    CLLocationCoordinate2D coord;
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
- (void) viewWillAppear;
//- (void) initViews;
- (void) addAllPins;
- (void) addPinWithTitle:(NSString *)title AndSub:(NSString *)subtitle AndCoordinate:(NSString *)strCoordinate;
- (IBAction)zoomIn:(id)sender;
- (IBAction)changeMapType:(id)sender;
- (IBAction)center:(id)sender;


@end