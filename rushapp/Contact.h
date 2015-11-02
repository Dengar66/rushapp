//
//  Contact.h
//  rushapp
//
//  Created by Brett Meyer on 11/1/15.
//

@interface Contact : NSObject

@property (nonatomic) NSString * name;
@property (nonatomic) NSString * position;
@property (nonatomic) NSString * phoneNumber;
@property (nonatomic) NSString * email;

-(instancetype) initWithName:(NSString *)name Position:(NSString *)position
                 PhoneNumber:(NSString *)phoneNumber Email:(NSString *)email;
@end
