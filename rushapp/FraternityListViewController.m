//
//  FraternityListView.m
//  rushapp
//
//  Created by Brett Meyer on 11/1/15.
//  Copyright © 2015 Paul Hurlbut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FraternityListViewController.h"
#import "Fraternity.h"
#import "Database.h"

@implementation FraternityListViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    //[self refresh];
    self.fraternityList = @[@"Acacia"];
    
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
    
    //cell.textLabel.text = [self.fraternityList[indexPath.row] fraternityName];
    cell.textLabel.text = self.fraternityList[indexPath.row];
    return cell;
}
- (IBAction)refresh {
    self.fraternityList = [[Database sharedDatabase] fraternityList];
    [self.tableView reloadData];
}


@end
