//
//  AppDelegate.h
//  JYMoran
//
//  Created by Joe on 10/18/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) UITabBarController *tabBarController;
@property (strong, nonatomic) UIImagePickerController *pickerController;

- (void)loadMainViewWithController:(UIViewController *)controller;
- (void)loadLoginView;

@end

