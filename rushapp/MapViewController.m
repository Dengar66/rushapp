//
//  MapViewController.m
//  rushapp
//
//  Created by Paul Hurlbut on 11/28/15.
//  Copyright © 2015 Paul Hurlbut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewWillAppear {
    self.navigationController.toolbarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _mapView.showsUserLocation = YES;
    _mapView.mapType = MKMapTypeStandard;
    _mapView.delegate = self;
    
    //LatLng of center Greek Row: 43.075946, -89.393694
    coord = CLLocationCoordinate2DMake(43.075946, -89.393694);
    _mapView.centerCoordinate = coord;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (coord, 800, 800);
    [_mapView setRegion:region animated:NO];
    
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.delegate = self;
    
    // this check is required for iOS 8+
    // selector 'requestWhenInUseAuthorization' is first introduced in iOS 8
    if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_locationManager requestWhenInUseAuthorization];
    }
    
    [_locationManager startUpdatingLocation];
    
    [self.view addSubview:_mapView];
}


/*- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    _mapView.centerCoordinate = userLocation.location.coordinate;
}

- (void)mapView:(MKMapView *)aMapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    CLLocationCoordinate2D location;
    location.latitude = userLocation.coordinate.latitude;
    location.longitude = userLocation.coordinate.longitude;
    region.span = span;
    region.center = location;
    [_mapView setRegion:region animated:YES];
}*/

- (IBAction)center:(id)sender {
    coord = CLLocationCoordinate2DMake(43.075946, -89.393694);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (coord, 500, 500);
    [_mapView setRegion:region animated:NO];
}

- (IBAction)zoomIn:(id)sender {
    MKUserLocation *userLocation = _mapView.userLocation;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (userLocation.location.coordinate, 2000, 2000);
    [_mapView setRegion:region animated:NO];
}

- (IBAction)changeMapType:(id)sender {
    if (_mapView.mapType == MKMapTypeStandard)
        _mapView.mapType = MKMapTypeSatellite;
    else
        _mapView.mapType = MKMapTypeStandard;
}


@end