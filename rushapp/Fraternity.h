//
//  Fraternity.h
//  rushapp
//
//  Created by Brett Meyer on 11/1/15.
//
#import <Foundation/Foundation.h>

@interface Fraternity : NSObject

@property (nonatomic) NSString * fraternityName;
@property (nonatomic) NSArray * contactList;
@property (nonatomic) NSArray * eventList;
@property (nonatomic) NSString * address;

-(instancetype)initWithName:(NSString *) name Address:(NSString *) address ContactList:(NSArray *)contactList EventList:(NSArray *)eventList;
@end