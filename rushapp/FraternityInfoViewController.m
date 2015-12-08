//
//  FraternityInfoViewController.m
//  rushapp
//
//  Created by Brett Meyer on 11/15/15.
//  Copyright © 2015 Paul Hurlbut. All rights reserved.
//

#import "FraternityInfoViewController.h"
#import "FraternityContactListTableViewController.h"
#import "FraternityEventListTableViewController.h"
#import "Database.h"

@interface FraternityInfoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *fraternityAddress;
@property (weak, nonatomic) IBOutlet UILabel *fraternityName;
@property (weak, nonatomic) IBOutlet UILabel *history;


@end

@implementation FraternityInfoViewController

- (void)viewWillAppear {
    [self.navigationController setToolbarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fraternityName.text = self.currentFraternity.fraternityName;
    self.fraternityAddress.text = self.currentFraternity.address;
    self.history.text = self.currentFraternity.history;
    self.currentFraternity.contactList = @[@"BRETT MEYER"];
    self.currentFraternity.eventList = @[@"TEST EVENT 0"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)contactListButton:(id)sender {
    self.nextScene = @"Contacts";
}
- (IBAction)eventListButton:(id)sender {
    self.nextScene = @"Events";
}

- (IBAction)favoriteButton:(id)sender {
    Database * d = [Database sharedDatabase];
    Fraternity * f = [[Fraternity alloc] init];
    f.fraternityName = self.fraternityName.text;
    [d.favoritedList addObject:f];
    
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([self.nextScene  isEqual: @"Contacts"]) {
        FraternityContactListTableViewController * vc = (FraternityContactListTableViewController *)[segue destinationViewController];
        vc.fraternityContactList = self.currentFraternity.contactList;
    }
    if ([self.nextScene isEqualToString:@"Events"]) {
        FraternityEventListTableViewController * vc = (FraternityEventListTableViewController *)[segue destinationViewController];
        vc.fraternityEventList = self.currentFraternity.eventList;
    }
}


@end
