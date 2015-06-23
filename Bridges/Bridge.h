//
//  Bridge.h
//  Bridges
//
//  Created by Kevin Favro on 4/27/15.
//  Copyright (c) 2015 SacMobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Bridge : NSObject <MKAnnotation>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *overview;
@property (nonatomic, strong) NSString *yearBuilt;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSString *length;
@property (nonatomic, strong) NSArray *imagePaths;

@property (nonatomic, copy, readonly) NSString *title;

@end
