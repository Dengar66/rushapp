//
//  House.m
//  rushapp
//
//  Created by Paul Hurlbut on 11/28/15.
//  Copyright © 2015 Paul Hurlbut. All rights reserved.
//

#import "House.h"

@implementation House

- (instancetype) initWithTitle:(NSString*)t Subtitle:(NSString*)s Latitude:(CLLocationDegrees)lat
                     Longitude:(CLLocationDegrees)lng
{
    self = [super init];
    
    if(self) {
        _title = t;
        _sub = s;
        _coord = CLLocationCoordinate2DMake(lat, lng);
    }
    return self;
}

@end
