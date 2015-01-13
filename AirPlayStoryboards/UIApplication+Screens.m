//
//  UIApplication+Screens.m
//
//  See LICENSE.txt for this sample’s licensing information
//  Created by Dan Zinngrabe on 12/28/14.
//  Copyright (c) 2014 Dan Zinngrabe. All rights reserved.
//

#import "UIApplication+Screens.h"

@implementation UIApplication (Screens)

- (void) beginReceivingScreenNotifications {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];

    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        // First handle any existing screens.
        if ([[UIScreen screens] count] > 1){
            for (UIScreen *screen in [UIScreen screens]){
                if (screen != [UIScreen mainScreen]){
                    [self applicationDidConnectScreen:screen];
                }
            }
        }
        
        [center addObserver:self selector:@selector(didReceiveConnectScreenNotification:)
                       name:UIScreenDidConnectNotification object:nil];
        [center addObserver:self selector:@selector(didReceiveDisconnectScreenNotification:)
                       name:UIScreenDidDisconnectNotification object:nil];
    }];
}

- (void) endReceivingScreenNotifications {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [center removeObserver:self name:UIScreenDidConnectNotification object:nil];
        
        [center removeObserver:self name:UIScreenDidDisconnectNotification object:nil];
    }];
}

- (void) didReceiveConnectScreenNotification:(id)notification {
    [self applicationDidConnectScreen:[notification object]];
}

- (void) didReceiveDisconnectScreenNotification:(id)notification {
    [self applicationDidDisconnectScreen:[notification object]];
}

- (void) applicationDidConnectScreen:(UIScreen *)screen {
    id<UIApplicationScreenDelegate>   del = (id<UIApplicationScreenDelegate>)[self delegate];
    
    if ([del respondsToSelector:@selector(application:didConnectScreen:)]){
        [del application:self didConnectScreen:screen];
    }
    
}

- (void) applicationDidDisconnectScreen:(UIScreen *)screen {
    id<UIApplicationScreenDelegate>   del = (id<UIApplicationScreenDelegate>)[self delegate];
    
    if ([del respondsToSelector:@selector(application:didDisconnectScreen:)]){
        [del application:self didDisconnectScreen:screen];
    }
}

@end
