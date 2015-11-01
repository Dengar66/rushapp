//
//  Event.m
//  rushapp
//
//  Created by Brett Meyer on 11/1/15.
//  Copyright © 2015 Paul Hurlbut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@implementation Event

-(instancetype) initWithEventName:(NSString *)eventName Place:(NSString *)place
                      Description:(NSString *)desc Time:(NSDate *)time
{
    self = [super init];
    
    if(self)
    {
        self.eventName = eventName;
        self.place = place;
        self.desc = desc;
        self.time = time;
    }
    return self;
}

//Override description
-(NSString *)description
{
    return [NSString stringWithFormat:@"EventName: %@\n Time: %@\n Place: %@\n description: %@\n ",
            self.eventName, self.time, self.place, self.desc];
}
@end
