//
//  FraternityListView.m
//  rushapp
//
//  Created by Brett Meyer on 11/1/15.
//  Copyright © 2015 Paul Hurlbut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FraternityListViewController.h"
#import "FraternityInfoViewController.h"
#import "Fraternity.h"
#import "Database.h"

@implementation FraternityListViewController

- (void)viewWillAppear {
    [self.navigationController setToolbarHidden:YES];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self refresh];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.fraternityList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [self.fraternityList[indexPath.row] fraternityName];
    return cell;
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FraternityInfoViewController * vc = (FraternityInfoViewController *)[segue destinationViewController];
    NSIndexPath * indexPath;
    if ((indexPath = self.tableView.indexPathForSelectedRow)) {
        Fraternity * f = self.fraternityList[indexPath.row];
        vc.currentFraternity = f;
    }
    
}

- (IBAction)refresh {
    self.fraternityList = [[Database sharedDatabase] fraternityList];
    [self.tableView reloadData];
}

@end