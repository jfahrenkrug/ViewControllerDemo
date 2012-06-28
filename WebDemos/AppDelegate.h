//
//  AppDelegate.h
//  WebDemos
//
//  Created by Johannes Fahrenkrug on 17.04.12.
//  Copyright (c) 2012 Springenwerk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@end
