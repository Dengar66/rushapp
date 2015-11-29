//
//  Header.h
//  rushapp
//
//  Created by Paul Hurlbut on 11/28/15.
//  Copyright © 2015 Paul Hurlbut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface House: NSObject
{
    NSString *title;
    NSString *sub;
    CLLocationCoordinate2D coord;
}

@property (nonatomic) CLLocationCoordinate2D coord;
@property(nonatomic) NSString *title;
@property(nonatomic) NSString *sub;

- (instancetype) initWithTitle:(NSString*)t Subtitle:(NSString*)s Latitude:(CLLocationDegrees)lat
                     Longitude:(CLLocationDegrees)lng;

@end