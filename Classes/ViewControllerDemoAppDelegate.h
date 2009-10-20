//
//  ViewControllerDemoAppDelegate.h
//  ViewControllerDemo
//
//  Created by Johannes Fahrenkrug on 20.10.09.
//  Copyright Springenwerk 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerDemoAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
