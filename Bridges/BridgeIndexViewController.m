//
//  BridgeIndexViewController.m
//  Bridges
//
//  Created by Kevin Favro on 4/27/15.
//  Copyright (c) 2015 SacMobile. All rights reserved.
//

#import "BridgeIndexViewController.h"

#import "AppDelegate.h"
#import "Bridge.h"
#import "BridgeTableViewCell.h"
#import "BridgeDetailViewController.h"

@interface BridgeIndexViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation BridgeIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.bridges = appDelegate.bridges;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.bridges.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BridgeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BridgeCell"];
    Bridge *bridge = self.bridges[indexPath.row];
    
    cell.bridgeName.text = bridge.name;
    cell.bridgeYear.text = bridge.yearBuilt;
    cell.bridgeDescription.text = bridge.overview;
    
    NSString *firstImagePath = [bridge.imagePaths firstObject];
    cell.bridgeImageView.image = [UIImage imageWithContentsOfFile:firstImagePath];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BridgeDetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"BridgeDetail"];
    Bridge *bridge = self.bridges[indexPath.row];
    detail.bridge = bridge;

    [self.navigationController pushViewController:detail animated:true];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    BridgeDetailViewController *detail = (BridgeDetailViewController *)[segue destinationViewController];
//
//    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//    Bridge *selectedBridge = self.bridges[indexPath.row];
//    detail.bridge = selectedBridge;
//}

@end
