//
//  Fraternity.m
//  rushapp
//
//  Created by Brett Meyer on 11/1/15.
//

#import <Foundation/Foundation.h>
#import "Fraternity.h"

@implementation Fraternity
/*
-(instancetype)initWithName:(NSString *) name Address:(NSString *) address ContactList:(NSArray *)contactList EventList:(NSArray *)eventList
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
}*/

- (id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.fraternityName = [dictionary valueForKey:@"name"];
        self.address = [dictionary valueForKey:@"location"];
        self.history = [dictionary valueForKey:@"history"];
        //[self setContactList];
    }
    return self;
}


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

//Override description
-(NSString *)description
{
    return [NSString stringWithFormat:@"Fraternity Name: %@\n Address: %@\n Event list:[%@] Contact List:[%@]",
            self.fraternityName, self.address, self.eventList, self.contactList];
}

- (void) encodeWithCoder:(NSCoder *)encode
{
    [encode encodeObject:self.fraternityName forKey:@"fraternityName"];
}

-(id) initWithCoder:(NSCoder *)decode
{
    self = [super init];
    if(self)
    {
        _fraternityName = [decode decodeObjectForKey:@"fraternityName"];
    }
    return self;
}
@end
