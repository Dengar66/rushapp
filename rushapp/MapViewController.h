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
- (IBAction)zoomIn:(id)sender;
- (IBAction)changeMapType:(id)sender;
- (IBAction)center:(id)sender;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end