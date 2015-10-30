//
//  DetailViewController.h
//  rushapp
//
//  Created by Paul Hurlbut on 10/30/15.
//  Copyright © 2015 Paul Hurlbut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

