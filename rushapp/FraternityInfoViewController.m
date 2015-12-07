//
//  FraternityInfoViewController.m
//  rushapp
//
//  Created by Brett Meyer on 11/15/15.
//  Copyright © 2015 Paul Hurlbut. All rights reserved.
//

#import "FraternityInfoViewController.h"

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)favorite:(id)sender {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
