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
        self.fraternityList = [self readFraternity];
        self.eventList = [self readEvent];
        //self.addressList = [self getAddressesFromFraternityList];
        //self.favoritedList = [NSMutableArray alloc];
    }
    return self;
}

//Parse through JSON files for needed data.
-(NSMutableArray *)readFraternity
{
    NSArray * data = [self readJSONFraternities];
    NSMutableArray * fraternities = [NSMutableArray array];
    
    for (NSDictionary *dictionary in data) {
        Fraternity * f = [[Fraternity alloc] initWithDictionary:dictionary];
        [fraternities addObject:f];
    }
    return fraternities;
}

-(NSMutableArray *)readEvent
{
    NSArray * data = [self readJSONEvents];
    NSMutableArray * events = [NSMutableArray array];
    
    for (NSDictionary *dictionary in data) {
        Event * event = [[Event alloc] initWithDictionary:dictionary];
        [events addObject:event];
    }
    return events;
}
//Method for reading in JSON files and returns an Array of dictionaries.
-(NSArray *)readJSONFraternities
{
    NSURLSession * session;
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    session = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];
    
    NSString *requestString = @"https://hidden-stream-3045.herokuapp.com/fraternities.json";
    NSURL *url = [NSURL URLWithString: requestString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask * dataTask = [session dataTaskWithRequest:req completionHandler:^(NSData * data, NSURLResponse * response, NSError * error){
        NSString * json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
        NSArray * dataFinal = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
        NSLog(@"%@",dataFinal);
        NSMutableArray * fraternities = [NSMutableArray array];
        
        for (NSDictionary *dictionary in dataFinal) {
            Fraternity * f = [[Fraternity alloc] initWithDictionary:dictionary];
            [fraternities addObject:f];
        }
        self.fraternityList = fraternities;
        
    }];
    
    [dataTask resume];
    return nil;
}

//Method for reading in JSON files and returns an Array of dictionaries.
-(NSArray *)readJSONEvents
{
    NSURLSession * session;
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    session = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];
    
    NSString *requestString = @"https://hidden-stream-3045.herokuapp.com/events.json";
    NSURL *url = [NSURL URLWithString: requestString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask * dataTask = [session dataTaskWithRequest:req completionHandler:^(NSData * data, NSURLResponse * response, NSError * error){
        NSString * json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
        NSArray * dataFinal = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
        NSLog(@"%@",dataFinal);
        NSMutableArray * events = [NSMutableArray array];
        
        for (NSDictionary *dictionary in dataFinal) {
            Event * f = [[Event alloc] initWithDictionary:dictionary];
            [events addObject:f];
        }
        self.eventList = events;
        
    }];
    
    [dataTask resume];
    return nil;
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



@end
