//
//  FratAnnotation.h
//  rushapp
//
//  Created by Paul Hurlbut on 11/28/15.
//  Copyright © 2015 Paul Hurlbut. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface FratAnnotation : NSObject<MKAnnotation> {
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) NSString *subtitle;


// add an init method so you can set the coordinate property on startup
- (id) initWithCoordinate:(CLLocationCoordinate2D)coord;

@end