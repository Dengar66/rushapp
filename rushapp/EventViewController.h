//
//  FraternityListView.h
//  rushapp
//
//  Created by Brett Meyer on 11/1/15.
//  Copyright © 2015 Paul Hurlbut. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface EventViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSArray * eventList;
@end
