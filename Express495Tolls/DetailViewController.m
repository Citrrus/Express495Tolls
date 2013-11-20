//
//  DetailViewController.m
//  Express495Tolls
//
//  Created by Matt Bowman on 11/20/13.
//  Copyright (c) 2013 Citrrus, LLC. All rights reserved.
//

#import "DetailViewController.h"
#import <UIImageView+WebCache.h>
#import <SDImageCache.h>
#import "TollLocation.h"

@interface DetailViewController ()

@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@property (weak, nonatomic) IBOutlet UIImageView *tollImage;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation DetailViewController

NSString *baseUrl = @"https://www.495expresslanes.com/generate-dms-sign.php?tmsName=%@&direction=%@";

#pragma mark - Managing the detail item

- (void)configureView
{
    if (self.toll)
    {
        self.title = self.toll.title;
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:baseUrl, self.toll.tmsName, self.toll.direction]];
        self.descriptionLabel.text = self.toll.desc;
        [[[SDWebImageManager sharedManager] imageCache] removeImageForKey:[url absoluteString]];
        [self.tollImage setImageWithURL:url];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
