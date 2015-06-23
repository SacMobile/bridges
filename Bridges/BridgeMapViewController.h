//
//  BridgeMapViewController.h
//  Bridges
//
//  Created by Kevin Favro on 6/22/15.
//  Copyright (c) 2015 SacMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface BridgeMapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) NSArray *bridges;
@property (weak, nonatomic) IBOutlet MKMapView *map;

@end
