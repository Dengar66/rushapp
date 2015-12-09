//
//  EventFeedTableTableViewController.m
//  rushapp
//
//  Created by Brett Meyer on 11/15/15.
//  Copyright © 2015 Paul Hurlbut. All rights reserved.
//

#import "EventFeedTableTableViewController.h"
#import "EventInformationViewController.h"
#import "Event.h"
#import "Database.h"


@implementation EventFeedTableTableViewController

- (void)viewWillAppear {
    [self.navigationController setToolbarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refresh];
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self
                            action:@selector(refresh)
                  forControlEvents:UIControlEventValueChanged];
    double startTime = [[NSDate date] timeIntervalSince1970];

    while ([self.eventList count] == 0) {
        [self refresh];
        double endTime = [[NSDate date] timeIntervalSince1970];
        if (endTime - startTime > 10) {
            //10 seconds have passed
            break;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.eventList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [self.eventList[indexPath.row] eventName];
    return cell;
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EventInformationViewController * vc = (EventInformationViewController *)[segue destinationViewController];
    NSIndexPath * indexPath;
    if ((indexPath = self.tableView.indexPathForSelectedRow)) {
        Event * e = self.eventList[indexPath.row];
        vc.currentEvent = e;
    }
    
}

- (IBAction)refresh {
    self.eventList = [[Database sharedDatabase] eventList];
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

@end
