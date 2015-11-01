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

-(instancetype)initWithName:(NSString *) name Address:(NSString *) address ContactList:(NSMutableArray *)contactList EventList:(NSMutableArray *)eventList
{
    self = [super init];
    
    if(self)
    {
        self.fraternityName = name;
        self.address = address;
        self.eventList = eventList;
        self.contactList = contactList;
    }
    return self;
}

//Override description
-(NSString *)description
{
    return [NSString stringWithFormat:@"Fraternity Name: %@\n Address: %@\n Event list:[%@] Contact List:[%@]",
            self.fraternityName, self.address, self.eventList, self.contactList];
}
@end
