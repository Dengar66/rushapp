//
//  FraternityInfoViewController.h
//  rushapp
//
//  Created by Brett Meyer on 11/15/15.
//  Copyright © 2015 Paul Hurlbut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Fraternity.h"

@interface FraternityInfoViewController : UIViewController
@property (weak,nonatomic)Fraternity * currentFraternity;
- (IBAction)favorite:(id)sender;

@end
