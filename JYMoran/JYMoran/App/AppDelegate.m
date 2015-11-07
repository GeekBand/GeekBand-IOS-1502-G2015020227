//
//  AppDelegate.m
//  JYMoran
//
//  Created by Joe on 10/18/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "AppDelegate.h"
#import "JYLoginAndRegisterViewController.h"
#import "JYMyViewController.h"
#import "JYSquareViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UITabBarController *tabBarController;

@end

@implementation AppDelegate

- (void)loadMainViewWithController:(UIViewController *)controller {
    // square
    UIStoryboard *squareStoryboard = [UIStoryboard storyboardWithName:@"JYSquare" bundle:[NSBundle mainBundle]];
    JYSquareViewController *squareVC = [squareStoryboard instantiateViewControllerWithIdentifier:@"SquareStoryboard"];
    UINavigationController *squareNav = [[UINavigationController alloc]initWithRootViewController:squareVC];
    
    
    // my
    UIStoryboard *myStoryboard = [UIStoryboard storyboardWithName:@"JYMy" bundle:[NSBundle mainBundle]];
//
//    UIViewController *squareVC = [[UIViewController alloc]init];
//    UINavigationController *squareNav = [[UINavigationController alloc]initWithRootViewController:squareVC];
//    squareNav.navigationBar.barTintColor = [[UIColor alloc]initWithRed:230/255.0 green:106/255.0 blue:58/255.0 alpha:1];
//    squareNav.tabBarItem.title = @"广场";
//    squareNav.tabBarItem.image = [UIImage imageNamed:@"square"];
//    
//    JYMyViewController *myVC = [myStoryboard instantiateViewControllerWithIdentifier:@"MyStoryboard"];
//    myVC.tabBarItem.title = @"我的";
//    myVC.tabBarItem.image = [UIImage imageNamed:@"my"];
    
//    self.tabBarController = [[UITabBarController alloc]init];
    self.tabBarController = [myStoryboard instantiateViewControllerWithIdentifier:@"MyTabBar"];
//    self.tabBarController.viewControllers = @[squareNav, myVC];
    
    [controller presentViewController:self.tabBarController animated:YES completion:nil];
    
    CGFloat viewWidth = [UIScreen mainScreen].bounds.size.width;
    
    UIButton *photoButton = [[UIButton alloc]initWithFrame:CGRectMake(viewWidth/2-60, -25, 120, 50)];
    [photoButton setImage:[UIImage imageNamed:@"publish"] forState:UIControlStateNormal];
    [self.tabBarController.tabBar addSubview:photoButton];
}

- (void)loadLoginView {
    UIStoryboard *loginStoryboard = [UIStoryboard storyboardWithName:@"JYLoginAndRegister" bundle:[NSBundle mainBundle]];
    JYLoginAndRegisterViewController *loginController = [loginStoryboard instantiateViewControllerWithIdentifier:@"LoginStoryboard"];
    [loginController dismissViewControllerAnimated:YES completion:nil];
}

#pragma Mark App lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
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
