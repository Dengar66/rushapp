//
//  Contact.m
//  rushapp
//
//  Created by Brett Meyer on 11/1/15.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@implementation Contact
-(instancetype) initWithName:(NSString *)name Position:(NSString *)position
                 PhoneNumber:(NSString *)phoneNumber Email:(NSString *)email
{
    self = [super init];
    
    if(self)
    {
        self.name = name;
        self.position = position;
        self.phoneNumber = phoneNumber;
        self.email = email;
    }
    return self;
}

//Override description
-(NSString *)description
{
    return [NSString stringWithFormat:@"Name: %@\n Position: %@\n PhoneNumber: %@\n Email: %@\n",
            self.name, self.position, self.phoneNumber, self.email];
}

@end
