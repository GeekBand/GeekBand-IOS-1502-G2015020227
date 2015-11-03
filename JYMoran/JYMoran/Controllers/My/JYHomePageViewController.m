//
//  JYHomePageViewController.m
//  JYMoran
//
//  Created by Joe on 11/3/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "JYHomePageViewController.h"

@interface JYHomePageViewController ()

@end

@implementation JYHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showHomePage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showHomePage {
    NSString *urlString = @"http://geekband.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
