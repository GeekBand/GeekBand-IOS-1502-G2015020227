//
//  JYMyViewController.m
//  JYMoran
//
//  Created by Joe on 10/27/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "JYMyViewController.h"

@interface JYMyViewController ()

@end

@implementation JYMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:237 green:127/255.0f blue:74/255.0f alpha:1.0f];
    self.headImageView.layer.cornerRadius = self.headImageView.frame.size.width / 2.0f;
    self.headImageView.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
