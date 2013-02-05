//
//  AppDelegate.m
//  DrawerFramework
//
//  Created by Ephraim Tekle on 2/1/13.
//  Copyright (c) 2013 Ephraim Tekle. All rights reserved.
//

#import "UINavigationController+GZDrawer.h"

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    
    [drawer release];
    [drawerTable release];
    
    [super dealloc];
}

- (void)showDrawerLeft {
    nav.topViewController.view.backgroundColor = [UIColor redColor]; 
    [nav pushDrawerViewController:drawerTable withStyle:DrawerLayoutStyleLeftAnchored animated:YES];
//    [nav pushDrawerViewController:drawer withStyle:DrawerLayoutStyleLeftFullscreen animated:YES];
    
    

}

- (void)showDrawerRight {
    nav.topViewController.view.backgroundColor = [UIColor blueColor];
    [nav pushDrawerViewController:drawer withStyle:DrawerLayoutStyleRightAnchored animated:YES];
//    [nav pushDrawerViewController:drawer withStyle:DrawerLayoutStyleRightFullscreen animated:YES];
}

- (void)hideDrawer {
    [nav popDrawerViewController:YES];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    //
    
    UIViewController *root = [[[UIViewController alloc] init] autorelease];
    root.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showDrawerLeft)];
    
    root.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showDrawerRight)];
    
    nav = [[UINavigationController alloc] initWithRootViewController:root];
    
    drawer = [[UIViewController alloc] init];
    drawer.view.backgroundColor = [UIColor greenColor];
    
    drawerTable = [[DrawerFriendlyTableViewController alloc] initWithStyle:UITableViewStylePlain] ;
    
    // Uncomment the following to see what happens if a tab bar is present
//    UITabBarController *tbc = [[UITabBarController alloc] init];
//    tbc.viewControllers = [NSArray arrayWithObject:nav];
//    self.window.rootViewController = tbc;
    
    self.window.rootViewController = nav;
    
    
    [nav addSwipeRecognizerForStyle:DrawerLayoutStyleRightAnchored withTarget:self selector:@selector(showDrawerRight)];
    [nav addSwipeRecognizerForStyle:DrawerLayoutStyleLeftAnchored withTarget:self selector:@selector(showDrawerLeft)];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
