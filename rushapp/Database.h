//
//  Database.h
//  rushapp
//
//  Created by Brett Meyer on 11/1/15.
//

@interface Database : NSObject

//Fields
@property (nonatomic) NSMutableArray * fraternityList;
@property (nonatomic) NSMutableArray * eventList;
@property (nonatomic) NSMutableArray * addressList;
@property (nonatomic) NSMutableArray * favoritedList;

//Initator
-(instancetype) init;

//Sort Arrays
-(void)sortEventList;
-(void)sortFraternityList;

@end
