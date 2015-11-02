//
//  Event.h
//  rushapp
//
//  Created by Brett Meyer on 11/1/15.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (nonatomic) NSString * eventName;
@property (nonatomic) NSString * place;
@property (nonatomic) NSString * desc;
@property (nonatomic) NSDate * time;

-(instancetype) initWithEventName:(NSString *)eventName Place:(NSString *)place
                      Description:(NSString *)desc Time:(NSDate *)time;

@end
