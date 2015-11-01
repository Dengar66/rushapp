//
//  Fraternity.h
//  rushapp
//
//  Created by Brett Meyer on 11/1/15.
//  Copyright © 2015 Paul Hurlbut. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface Fraternity : NSObject

@property (nonatomic) NSString * name;
@property (nonatomic) NSMutableArray * contactList;
@property (nonatomic) NSMutableArray * eventList;
@property (nonatomic) NSString * address;

-(instancetype)initWithName:(NSString *) name;
@end