//
//  Fraternity.m
//  rushapp
//
//  Created by Brett Meyer on 11/1/15.
//  Copyright © 2015 Paul Hurlbut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraternity.h"

@implementation Fraternity

-(instancetype)initWithName:(NSString *) name
{
    self = [super init];
    
    if(self)
    {
        self.name = name;
    }
    return self;
}

@end
