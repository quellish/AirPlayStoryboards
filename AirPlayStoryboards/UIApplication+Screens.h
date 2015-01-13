//
//  UIApplication+Screens.h
//  
//  See LICENSE.txt for this sample’s licensing information
//  Created by Dan Zinngrabe on 12/28/14.
//  Copyright (c) 2014 Dan Zinngrabe. All rights reserved.
//

@import UIKit;

/**
 *  Informal protocol extending UIApplication to begin and end screen connection notifications.
 */

@interface UIApplication (Screens)

/**
 *  beginReceivingScreenNotifications
 */

- (void) beginReceivingScreenNotifications;

/**
 *  endReceivingScreenNotifications
 */

- (void) endReceivingScreenNotifications;

@end

/**
 *  Extension to the UIApplicationDelegate protocol that provides optional methods for notifying the delegate of screen changes.
 */

@protocol UIApplicationScreenDelegate <UIApplicationDelegate>

@optional

/**
 *  application:didConnectScreen:
 *
 *  @param application The application.
 *  @param screen      The screen that has connected.
 */

- (void) application:(UIApplication *)application didConnectScreen:(UIScreen *)screen;

/**
 *  application:didDisconnectScreen:
 *
 *  @param application The application
 *  @param screen      The screen that has been disconnected.
 */

- (void) application:(UIApplication *)application didDisconnectScreen:(UIScreen *)screen;

@end
