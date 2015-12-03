//
//  MapViewController.m
//  rushapp
//
//  Created by Paul Hurlbut on 11/28/15.
//  Copyright © 2015 Paul Hurlbut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapViewController.h"
#import "FratAnnotation.h"
#import "House.h"


@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewWillAppear {
    [self.navigationController setToolbarHidden:NO];
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
    
    // add annotations
    [self addAllPins];
    
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.delegate = self;
    
    // this check is required for iOS 8+
    // selector 'requestWhenInUseAuthorization' is first introduced in iOS 8
    if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_locationManager requestWhenInUseAuthorization];
    }
    
    [_locationManager startUpdatingLocation];
    
    [self.view addSubview:self.mapView];
}

- (void)addAllPins
{
    self.mapView.delegate=self;
    
    NSArray *houseNames = [NSArray arrayWithObjects:
                           @"Acacia", //Acacia
                           @"Alpha Delta Phi", //ADPhi
                           @"Alpha Gamma Rho", //AGR
                           @"Beta Theta Pi", //BThetaPi
                           @"Chi Psi", //Lodge
                           @"Delta Chi", //DX
                           @"Delta Tau Delta", //DTD
                           @"Delta Theta Sigma", //DTS
                           @"Delta Upsilon", //DU
                           @"Kappa Sigma", //KappaSig
                           @"Phi Gamma Delta", //FIJI
                           @"Pi Kappa Alpha", //PIKE
                           @"Pi Lambda Phi", //PiLam
                           @"Sigma Alpha Epsilon", //SAE
                           @"Sigma Chi", //SigChi
                           @"Sigma Phi Epsilon", //SigEp
                           @"Sigma Pi", //SigmaPi
                           @"Tau Kappa Epsilon", //TKE
                           @"Theta Chi", //ThetaChi
                           @"Theta Delta Chi", //TDX
                           @"Triangle", //Triangle
                           @"Zeta Beta Tau", //ZBT
                           nil
                           ];
    NSArray *addresses = [NSArray arrayWithObjects:
                          @"201 W. Lakelawn Place", //Acacia
                          @"640 N. Henry Street",
                          @"233 W. Lakelawn Place", //AGR
                          @"622 Mendota Court",
                          @"150 Iota Court",
                          @"137 Langdon Street", //DX
                          @"12 Langdon Street",
                          @"252 Langdon Street",
                          @"644 N. Frances Street",
                          @"124 Langdon Street",
                          @"16 Langdon Street",
                          @"104 Langdon Street",
                          @"621 N. Frances Street",
                          @"627 N. Lake Street",
                          @"221 Langdon Street", //SigChi
                          @"237 Langdon Street",
                          @"420 N. Carroll Street",
                          @"216 Langdon Street",
                          @"210 Langdon Street",
                          @"144 Langdon Street", //TDX
                          @"148 Breese Terrace",
                          @"626 N. Henry Street",
                          nil
                          ];
    
    NSMutableArray *arrCoordinateStr = [[NSMutableArray alloc] initWithCapacity:houseNames.count];
    
    [arrCoordinateStr addObject:@"43.076456, -89.393442"];
    [arrCoordinateStr addObject:@"43.077571, -89.393746"];
    [arrCoordinateStr addObject:@"43.077241, -89.394501"];
    [arrCoordinateStr addObject:@"43.076741, -89.396262"];
    [arrCoordinateStr addObject:@"43.077696, -89.393413"]; //Lodge
    [arrCoordinateStr addObject:@"43.076927, -89.392051"];
    [arrCoordinateStr addObject:@"43.078891, -89.390570"];
    [arrCoordinateStr addObject:@"43.075903, -89.394530"];
    [arrCoordinateStr addObject:@"43.077085, -89.395382"];
    [arrCoordinateStr addObject:@"43.078133, -89.392119"]; //KappaSig
    [arrCoordinateStr addObject:@"43.078595, -89.3904700"]; //FIJI
    [arrCoordinateStr addObject:@"43.077953, -89.390983"]; //PIKE
    [arrCoordinateStr addObject:@"43.076649, -89.395160"];
    [arrCoordinateStr addObject:@"43.076783, -89.397134"];
    [arrCoordinateStr addObject:@"43.076207, -89.392986"];
    [arrCoordinateStr addObject:@"43.075755, -89.393549"]; //SigEp
    [arrCoordinateStr addObject:@"43.077111, -89.389868"];
    [arrCoordinateStr addObject:@"43.076546, -89.393176"];
    [arrCoordinateStr addObject:@"43.076671, -89.392940"];
    [arrCoordinateStr addObject:@"43.077745, -89.392498"];
    [arrCoordinateStr addObject:@"43.071379, -89.414083"];
    [arrCoordinateStr addObject:@"43.077264, -89.393400"]; //ZBT
    
    for(int i = 0; i < houseNames.count; i++)
    {
        [self addPinWithTitle:houseNames[i] AndSub:addresses[i] AndCoordinate:arrCoordinateStr[i]];
    }
}

- (void) addPinWithTitle:(NSString *)title AndSub:(NSString *)subtitle AndCoordinate:(NSString *)strCoordinate
{
    MKPointAnnotation *mapPin = [[MKPointAnnotation alloc] init];
    
    // clear out any white space
    strCoordinate = [strCoordinate stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    // convert string into actual latitude and longitude values
    NSArray *components = [strCoordinate componentsSeparatedByString:@","];
    
    double latitude = [components[0] doubleValue];
    double longitude = [components[1] doubleValue];
    
    // setup the map pin with all data and add to map view
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    
    mapPin.title = title;
    mapPin.subtitle = subtitle;
    mapPin.coordinate = coordinate;
    
    [self.mapView addAnnotation:mapPin];
}

/*- (void)addAnnotations {

    //House *acacia = [[House alloc] initWithTitle:@"Acacia" Subtitle:@"201 W. Lakelawn Place" Latitude:43.076456 Longitude:-89.393442];
    //House *alphaDeltaPhi = 43.077571, -89.393746
    //House *alphaGammaRho = 43.077241, -89.394501
    //House *betaThetaPi = 43.076741, -89.396262
    //House *chiPsi = 43.077696, -89.393413
    //House *deltaChi = 43.076927, -89.392051
    //House *deltaTauDelta = 43.078891, -89.390570
    //House *deltaThetaSigma = 43.075903, -89.394530
    //House *deltaUpsilon = 43.077085, -89.395382
    //House *kappaSigma = 43.078133, -89.392119
    //House *phiGammaDelta = 43.078595, -89.390470 "FIJI"
    //House *piKappaAlpha = 43.077953, -89.390983 "PIKE"
    //House *piLambdaPhi = 43.076649, -89.395160
    //House *sigmaAlphaEpsilon = 43.076783, -89.397134
    //House *sigmaChi = 43.076207, -89.392986
    //House *sigmaPhiEpsilon = 43.075755, -89.393549
    //House *sigmaPi = 43.077111, -89.389868
    //House *tauKappaEpsilon = 43.076546, -89.393176
    //House *thetaChi = 43.076671, -89.392940
    //House *thetaDeltaChi = 43.077745, -89.392498
    //House *triangle = 43.071379, -89.414083
    //House *zetaBetaTau = 43.077264, -89.393400
    
    NSArray *houseNames = [NSArray arrayWithObjects:
                           @"Acacia", //Acacia
                           @"Alpha Delta Phi", //ADPhi
                           @"Alpha Gamma Rho", //AGR
                           @"Beta Theta Pi", //BThetaPi
                           @"Chi Psi", //Lodge
                           @"Delta Chi", //DX
                           @"Delta Tau Delta", //DTD
                           @"Delta Theta Sigma", //DTS
                           @"Delta Upsilon", //DU
                           @"Kappa Sigma", //KappaSig
                           @"Phi Gamma Delta", //FIJI
                           @"Pi Kappa Alpha", //PIKE
                           @"Pi Lambda Phi", //PiLam
                           @"Sigma Alpha Epsilon", //SAE
                           @"Sigma Chi", //SigChi
                           @"Sigma Phi Epsilon", //SigEp
                           @"Sigma Pi", //SigmaPi
                           @"Tau Kappa Epsilon", //TKE
                           @"Theta Chi", //ThetaChi
                           @"Theta Delta Chi", //TDX
                           @"Triangle", //Triangle
                           @"Zeta Beta Tau", //ZBT
                           nil
                           ];
    NSArray *addresses = [NSArray arrayWithObjects:
                          @"201 W. Lakelawn Place", //Acacia
                          @"640 N. Henry Street",
                          @"233 W. Lakelawn Place", //AGR
                          @"622 Mendota Court",
                          @"150 Iota Court",
                          @"137 Langdon Street", //DX
                          @"12 Langdon Street",
                          @"252 Langdon Street",
                          @"644 N. Frances Street",
                          @"124 Langdon Street",
                          @"16 Langdon Street",
                          @"104 Langdon Street",
                          @"621 N. Frances Street",
                          @"627 N. Lake Street",
                          @"221 Langdon Street", //SigChi
                          @"237 Langdon Street",
                          @"420 N. Carroll Street",
                          @"216 Langdon Street",
                          @"210 Langdon Street",
                          @"144 Langdon Street", //TDX
                          @"148 Breese Terrace",
                          @"626 N. Henry Street",
                          nil
                          ];
    
    NSMutableArray *latArray = [[NSMutableArray alloc] initWithCapacity:0];
    [latArray addObject:[NSNumber numberWithDouble:43.076456]];
    [latArray addObject:[NSNumber numberWithDouble:43.077571]];
    [latArray addObject:[NSNumber numberWithDouble:43.077241]];
    [latArray addObject:[NSNumber numberWithDouble:43.076741]];
    [latArray addObject:[NSNumber numberWithDouble:43.077696]]; //Lodge
    [latArray addObject:[NSNumber numberWithDouble:43.076927]];
    [latArray addObject:[NSNumber numberWithDouble:43.078891]];
    [latArray addObject:[NSNumber numberWithDouble:43.075903]];
    [latArray addObject:[NSNumber numberWithDouble:43.077085]];
    [latArray addObject:[NSNumber numberWithDouble:43.078133]]; //KappaSig
    [latArray addObject:[NSNumber numberWithDouble:43.078595]];
    [latArray addObject:[NSNumber numberWithDouble:43.077953]]; //PIKE
    [latArray addObject:[NSNumber numberWithDouble:43.076649]];
    [latArray addObject:[NSNumber numberWithDouble:43.076783]];
    [latArray addObject:[NSNumber numberWithDouble:43.076207]];
    [latArray addObject:[NSNumber numberWithDouble:43.075755]]; //SigEp
    [latArray addObject:[NSNumber numberWithDouble:43.077111]];
    [latArray addObject:[NSNumber numberWithDouble:43.076546]];
    [latArray addObject:[NSNumber numberWithDouble:43.076671]];
    [latArray addObject:[NSNumber numberWithDouble:43.077745]];
    [latArray addObject:[NSNumber numberWithDouble:43.071379]];
    [latArray addObject:[NSNumber numberWithDouble:43.077264]]; //ZBT
    
    NSMutableArray *lngArray = [[NSMutableArray alloc] initWithCapacity:0];
    [lngArray addObject:[NSNumber numberWithDouble:-89.393442]];
    [lngArray addObject:[NSNumber numberWithDouble:-89.393746]];
    [lngArray addObject:[NSNumber numberWithDouble:-89.394501]];
    [lngArray addObject:[NSNumber numberWithDouble:-89.396262]];
    [lngArray addObject:[NSNumber numberWithDouble:-89.393413]]; //Lodge
    [lngArray addObject:[NSNumber numberWithDouble:-89.392051]];
    [lngArray addObject:[NSNumber numberWithDouble:-89.390570]];
    [lngArray addObject:[NSNumber numberWithDouble:-89.394530]];
    [lngArray addObject:[NSNumber numberWithDouble:-89.395382]];
    [lngArray addObject:[NSNumber numberWithDouble:-89.392119]]; //KappaSig
    [lngArray addObject:[NSNumber numberWithDouble:-89.3904700]];
    [lngArray addObject:[NSNumber numberWithDouble:-89.390983]]; //PIKE
    [lngArray addObject:[NSNumber numberWithDouble:-89.395160]];
    [lngArray addObject:[NSNumber numberWithDouble:-89.397134]];
    [lngArray addObject:[NSNumber numberWithDouble:-89.392986]];
    [lngArray addObject:[NSNumber numberWithDouble:-89.393549]]; //SigEp
    [lngArray addObject:[NSNumber numberWithDouble:-89.389868]];
    [lngArray addObject:[NSNumber numberWithDouble:-89.393176]];
    [lngArray addObject:[NSNumber numberWithDouble:-89.392940]];
    [lngArray addObject:[NSNumber numberWithDouble:-89.392498]];
    [lngArray addObject:[NSNumber numberWithDouble:-89.414083]];
    [lngArray addObject:[NSNumber numberWithDouble:-89.393400]]; //ZBT

    int num = [houseNames count];
    int i = 0;
    while (i < num) {
        CLLocationCoordinate2D fHouse = CLLocationCoordinate2DMake([[latArray objectAtIndex:i] doubleValue], [[lngArray objectAtIndex:i] doubleValue]);
        FratAnnotation * annotation = [[FratAnnotation alloc] initWithCoordinate:fHouse];
        annotation.title= [houseNames objectAtIndex:i]; // HOUSE NAME (aka Acacia House)
        annotation.subtitle = [addresses objectAtIndex:i]; // HOUSE ADDRESS (aka 201 W. Lakelawn Place)
        
        [_mapView addAnnotation:annotation];
    }
    
    
    /*_mapView.annotations;
    CLLocationCoordinate2DMake(43.076456, -89.393442),
    CLLocationCoordinate2DMake(43.077571, -89.393746),
    CLLocationCoordinate2DMake(43.077241, -89.394501),
    CLLocationCoordinate2DMake(43.076741, -89.396262),
    CLLocationCoordinate2DMake(43.077696, -89.393413), //Lodge
    CLLocationCoordinate2DMake(43.076927, -89.392051),
    CLLocationCoordinate2DMake(43.078891, -89.390570),
    CLLocationCoordinate2DMake(43.075903, -89.394530),
    CLLocationCoordinate2DMake(43.077085, -89.395382),
    CLLocationCoordinate2DMake(43.078133, -89.392119), //KappaSig
    CLLocationCoordinate2DMake(43.078595, -89.3904700), //FIJI
    CLLocationCoordinate2DMake(43.077953, -89.390983), //PIKE
    CLLocationCoordinate2DMake(43.076649, -89.395160),
    CLLocationCoordinate2DMake(43.076783, -89.397134),
    CLLocationCoordinate2DMake(43.076207, -89.392986),
    CLLocationCoordinate2DMake(43.075755, -89.393549), //SigEp
    CLLocationCoordinate2DMake(43.077111, -89.389868),
    CLLocationCoordinate2DMake(43.076546, -89.393176),
    CLLocationCoordinate2DMake(43.076671, -89.392940),
    CLLocationCoordinate2DMake(43.077745, -89.392498),
    CLLocationCoordinate2DMake(43.071379, -89.414083),
    CLLocationCoordinate2DMake(43.077264, -89.393400), //ZBT
    nil
    ;
}*/

/*- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    
    
    return nil;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
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
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (userLocation.location.coordinate, 200, 200);
    [_mapView setRegion:region animated:NO];
}

- (IBAction)changeMapType:(id)sender {
    if (_mapView.mapType == MKMapTypeStandard)
        _mapView.mapType = MKMapTypeSatellite;
    else
        _mapView.mapType = MKMapTypeStandard;
}


@end