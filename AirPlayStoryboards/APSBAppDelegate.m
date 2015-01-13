//
//  AppDelegate.m
//  AirPlayStoryboards
//
//  See LICENSE.txt for this sample’s licensing information
//  Created by Dan Zinngrabe on 1/12/15.
//  Copyright (c) 2015 Dan Zinngrabe. All rights reserved.
//

#import "APSBAppDelegate.h"

@interface APSBAppDelegate ()
@property (nonatomic, strong)   NSMutableArray    *windows;
@end

@implementation APSBAppDelegate
@synthesize window;
@synthesize windows;


- (BOOL)application:(UIApplication *)__unused application didFinishLaunchingWithOptions:(NSDictionary *)__unused launchOptions {
    // Start monitoring screen changes using our informal protocol.
    [self setWindows:[NSMutableArray new]];
    [application beginReceivingScreenNotifications];
    return YES;
}

- (void) applicationDidReceiveMemoryWarning:(UIApplication *)__unused application {
    
}

#pragma mark UIApplicationScreenDelegate methods

- (void) application:(UIApplication *)__unused application didConnectScreen:(UIScreen *) screen {
    UIStoryboard        *storyboard     = nil;
    UIWindow            *screenWindow   = nil;
    UIViewController    *viewController = nil;
    
    // Create a window and attach it to the screen.
    screenWindow = [[UIWindow alloc] initWithFrame:[screen bounds]];
    [screenWindow setScreen:screen];
    
    // Instantiate the correct view controller from the storyboard
    storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle bundleForClass:[self class]]];
    viewController = [storyboard instantiateViewControllerWithIdentifier:@"viewController"];
    
    [screenWindow setRootViewController:viewController];
    [screenWindow setHidden:NO];
    
    // If you do not retain the window, it will go away and you will see nothing.
    [[self windows] addObject:screenWindow];
}

- (void) application:(UIApplication *)__unused application didDisconnectScreen:(UIScreen *) screen {
    // Iterate through the windows we know about looking for the matching screen.
    [[self windows] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj screen] == screen){
            [[self windows] removeObjectAtIndex:idx];
            *stop = YES;
        }
    }];
}

@end
