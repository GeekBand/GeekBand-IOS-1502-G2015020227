//
//  JYNickNameViewController.m
//  JYMoran
//
//  Created by Joe on 11/3/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "JYNickNameViewController.h"
#import "JYGlobal.h"

@implementation JYNickNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)doneBarButtonClicked:(id)sender {
    JYEditNickNameRequest *request = [[JYEditNickNameRequest alloc]init];
    [request sendEditNickNameRequest:self.nickNameTextField.text delegate:self];
}

- (void)editNickNameRequestSuccess:(JYEditNickNameRequest *)request {
    [JYGlobal shareGlobal].user.username = self.nickNameTextField.text;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)editNickNameRequestFailed:(JYEditNickNameRequest *)request error:(NSError *)error {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
