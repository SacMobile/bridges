//
//  BridgeMapViewController.m
//  Bridges
//
//  Created by Kevin Favro on 6/22/15.
//  Copyright (c) 2015 SacMobile. All rights reserved.
//

#import "BridgeMapViewController.h"

#import "AppDelegate.h"
#import "Bridge.h"
#import "BridgeDetailViewController.h"

@implementation BridgeMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.bridges = appDelegate.bridges;

    self.map.delegate = self;

    [self.map showAnnotations:self.bridges animated:true];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"loc"];
    annotationView.canShowCallout = true;
    annotationView.pinColor = MKPinAnnotationColorGreen;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];

    return annotationView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    Bridge *bridge = view.annotation;
    BridgeDetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"BridgeDetail"];
    detail.bridge = bridge;
    [self.navigationController pushViewController:detail animated:true];
}

@end
