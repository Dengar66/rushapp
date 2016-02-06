//
//  EventFeedTableViewCell.h
//  rushapp
//
//  Created by Brett Meyer on 2/6/16.
//  Copyright © 2016 Paul Hurlbut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventFeedTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *eventName;
@property (weak, nonatomic) IBOutlet UILabel *information;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
