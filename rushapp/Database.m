//
//  Database.m
//  rushapp
//
//  Created by Brett Meyer on 11/1/15.
//

#import <Foundation/Foundation.h>
#import "Database.h"
#import "Event.h"
#import "Fraternity.h"

@implementation Database

//Singleton model
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
        self.fraternityList = [self readFraternityJSON];
        //self.eventList = [self readEventJSON];
       // self.addressList = [self getAddressesFromFraternityList];
        //self.favoritedList = [NSMutableArray alloc];
    }
    return self;
}
//Parse through JSON files for needed data.
-(NSMutableArray *)readFraternityJSON
{
    NSArray * data = [self readJSON];
    NSMutableArray * fraternities = [NSMutableArray array];
    
    for (NSDictionary *dictionary in data) {
        Fraternity * f = [[Fraternity alloc] initWithDictionary:dictionary];
        [fraternities addObject:f];
    }
    return fraternities;
}
-(NSMutableArray *)readEventJSON
{
    NSArray * data = [self readJSON];
    NSMutableArray * events = [NSMutableArray array];
    
    for (NSDictionary *dictionary in data) {
        Event * event = [[Event alloc] initWithDictionary:dictionary];
        [events addObject:event];
    }
    return events;
}
//Method for reading in JSON files and returns an Array of dictionaries.
-(NSArray *)readJSON
{
    NSURL * url = [NSURL fileURLWithPath:@"/Users/brettmeyer/Documents/test.json"];
    NSError *error = nil;
    
    NSString *jsonString =
    [NSString stringWithContentsOfURL:url
                             encoding:NSUTF8StringEncoding
                                error:&error];
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSArray * data = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
    return data;
}

-(NSMutableArray *)getAddressesFromFraternityList
{
    //TODO: create address object with fraternity name
    NSMutableArray * addresses = [NSMutableArray array];
    for (Fraternity * f in self.fraternityList)
    {
        [addresses addObject:f.address];
    }
    return addresses;
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
