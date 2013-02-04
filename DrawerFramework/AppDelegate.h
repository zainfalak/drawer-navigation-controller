//
//  AppDelegate.h
//  DrawerFramework
//
//  Created by Ephraim Tekle on 2/1/13.
//  Copyright (c) 2013 Ephraim Tekle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawerFriendlyTableViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UINavigationController *nav;
    UIViewController *drawer;
    DrawerFriendlyTableViewController *drawerTable;
}

@property (strong, nonatomic) UIWindow *window;

@end
