//
//  Database.m
//  rushapp
//
//  Created by Brett Meyer on 11/1/15.
//

#import <Foundation/Foundation.h>
#import "Database.h"
#import "Event.h"

@implementation Database

+(instancetype) sharedDatabase
{
    static Database * sharedDatabase;
    
    if(!sharedDatabase)
    {
        sharedDatabase = [[self alloc] initPrivate];
    }
    return sharedDatabase;
}
-(instancetype) init
{
    [NSException raise:@"Singleton" format:@"USE +[Database sharedDatabase]"];
    return nil;
}
-(instancetype) initPrivate
{
    self = [super init];
    if (self)
    {
        self.fraternityList = [NSMutableArray alloc];
        self.eventList = [NSMutableArray alloc];
        self.addressList = [NSMutableArray alloc];
        self.favoritedList = [NSMutableArray alloc];
    }
    return self;
}

-(void)sortEventList
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"time" ascending:TRUE];
    [self.eventList sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
}

-(void)sortFraternityList
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:TRUE];
    [self.fraternityList sortUsingDescriptors:@[sortDescriptor]];
}
-(void)addFraternityListObject:(Fraternity *)object
{
    [self.fraternityList addObject:object];
}

@end
