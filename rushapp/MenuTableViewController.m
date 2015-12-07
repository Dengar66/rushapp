//
//  MenuTableViewController.m
//  rushapp
//
//  Created by Brett Meyer on 12/7/15.
//  Copyright © 2015 Paul Hurlbut. All rights reserved.
//

#import "MenuTableViewController.h"

@interface MenuTableViewController ()

@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController pushViewController:self animated:YES];
    self.navigationController.viewControllers = [[NSArray alloc] initWithObjects:self, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
