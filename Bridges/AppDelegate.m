//
//  AppDelegate.m
//  Bridges
//
//  Created by Kevin Favro on 4/27/15.
//  Copyright (c) 2015 SacMobile. All rights reserved.
//

#import "AppDelegate.h"
#import "Bridge.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // log out the documents directory
    NSLog(@"%@", [[NSBundle mainBundle] pathsForResourcesOfType:@"jpg" inDirectory:@"bridge_data/american_river"]);

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"bridge_data/Bridges" ofType:@"plist"];
    NSArray *bridges = [[NSArray alloc] initWithContentsOfFile:filePath];
    
    NSMutableArray *mBridges = [NSMutableArray arrayWithCapacity:bridges.count];
    
    for (NSDictionary *dict in bridges) {
        Bridge *bridge = [[Bridge alloc] init];
        bridge.name = [dict objectForKey:@"name"];
        bridge.overview = [dict objectForKey:@"overview"];
        bridge.yearBuilt = [dict objectForKey:@"year"];
        bridge.length = dict[@"length"];

        CLLocationDegrees lat = [dict[@"latitude"] doubleValue];
        CLLocationDegrees lng = [dict[@"longitude"] doubleValue];
        bridge.coordinate = CLLocationCoordinate2DMake(lat, lng);
        
        NSString *directoryPath = [NSString stringWithFormat:@"bridge_data/%@", dict[@"folderId"]];
        bridge.imagePaths = [[NSBundle mainBundle] pathsForResourcesOfType:@"jpg" inDirectory:directoryPath];
        
        [mBridges addObject:bridge];
    }
    
    self.bridges = mBridges;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
