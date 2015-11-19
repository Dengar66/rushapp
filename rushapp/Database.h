//
//  Database.h
//  rushapp
//
//  Created by Brett Meyer on 11/1/15.
//
@class Fraternity;
@interface Database : NSObject

//Fields
@property (nonatomic) NSArray * fraternityList;
@property (nonatomic) NSArray * eventList;
@property (nonatomic) NSArray * temp;
@property (nonatomic) NSData * jsonData;
//@property (nonatomic) NSMutableArray * favoritedList;

//Initator
+(instancetype) sharedDatabase;

//Sort Arrays
-(void)sortEventList;

@end
