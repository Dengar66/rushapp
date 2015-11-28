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

IBOutlet MKMapView *mapView;

@interface MapViewController : UIViewController <MKMapViewDelegate> {
    MKMapView *mapView;
}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end