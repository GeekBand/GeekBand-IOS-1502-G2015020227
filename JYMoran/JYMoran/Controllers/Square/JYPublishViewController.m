//
//  JYPublishViewController.m
//  JYMoran
//
//  Created by joeyu on 11/15/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "JYPublishViewController.h"

@interface JYPublishViewController () {
    UILabel *titleLabel;
}

@end

@implementation JYPublishViewController

- (void)makePulishButton {
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-65, 0, 50, 40)];
    button.backgroundColor = [UIColor whiteColor];
    button.alpha = 0.8;
    [button setTitle:@"发布" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(publishPhotoButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = 3.0;
    button.clipsToBounds = YES;
    [self.navigationController.navigationBar addSubview:button];
}

- (void)publishPhotoButtonClicked {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.backgroundColor = [[UIColor alloc]initWithRed:230/255.0 green:230/255.0 blue:58/255.0 alpha:1];
    self.navigationController.navigationBar.barTintColor = [[UIColor alloc]initWithRed:230/255.0 green:230/255.0 blue:58/255.0 alpha:1];
    [self.navigationController.navigationBar setAlpha:1.0];
    self.textView.delegate = self;
    
    //title label
    titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-30, 10, 100, 30)];
    titleLabel.text = @"发布照片";
    titleLabel.textColor = [UIColor whiteColor];
    [self.navigationController.navigationBar addSubview:titleLabel];
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
