//
//  FraternityListView.h
//  rushapp
//
//  Created by Brett Meyer on 11/1/15.
//  Copyright © 2015 Paul Hurlbut. All rights reserved.
//
#import <UIKit/UIKit.h>
@class Database;

@interface FraternityListViewController : UITableViewController <UITableViewDelegate>
{
    NSMutableArray * fraternityList;
}

@property (nonatomic) NSArray * fraternityList;
@end
