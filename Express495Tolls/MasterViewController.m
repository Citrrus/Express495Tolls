//
//  MasterViewController.m
//  Express495Tolls
//
//  Created by Matt Bowman on 11/20/13.
//  Copyright (c) 2013 Citrrus, LLC. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "TollLocations.h"
#import "TollLocation.h"

@interface MasterViewController ()

@property (nonatomic)NSArray *objects;

@end

@implementation MasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    self.objects = [[TollLocations tollData] sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"latitude" ascending:NO]]];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    TollLocation *object = self.objects[indexPath.row];
    cell.textLabel.numberOfLines = 1;
    cell.textLabel.minimumScaleFactor = .01;
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.textLabel.text = [object title];
    cell.detailTextLabel.text = object.desc;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        TollLocation *object = self.objects[indexPath.row];
        self.detailViewController.toll = object;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        TollLocation *object = self.objects[indexPath.row];
        ((DetailViewController*)segue.destinationViewController).toll = object;
    }
}

@end
