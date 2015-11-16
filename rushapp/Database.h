//
//  Database.h
//  rushapp
//
//  Created by Brett Meyer on 11/1/15.
//
@class Fraternity;
@interface Database : NSObject

//Fields
@property (nonatomic) NSMutableArray * fraternityList;
@property (nonatomic) NSMutableArray * eventList;
@property (nonatomic) NSMutableArray * addressList;
//@property (nonatomic) NSMutableArray * favoritedList;

//Initator
+(instancetype) sharedDatabase;

//Sort Arrays
-(void)sortEventList;
-(void)sortFraternityList;
-(void)addFraternityListObject:(Fraternity *)object;
@end
