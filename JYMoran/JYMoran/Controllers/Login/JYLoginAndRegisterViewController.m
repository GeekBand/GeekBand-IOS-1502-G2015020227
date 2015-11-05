//
//  LoginAndRegisterViewController.m
//  JYMoran
//
//  Created by Joe on 10/21/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "JYLoginAndRegisterViewController.h"
#import "AppDelegate.h"
#import "JYGlobal.h"
#import "JYGetImage.h"

@interface JYLoginAndRegisterViewController ()

@end

@implementation JYLoginAndRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.emailTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    self.emailTextField.text = @"joeyu@live.cn";
    self.passwordTextField.text = @"123456";
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

- (IBAction)loginButtonClicked:(id)sender {
    NSString *userName = self.emailTextField.text;
    NSString *password = self.passwordTextField.text;
    
    if (([userName length] == 0) || [password length] == 0) {
        [self showErrorMessage:@"邮箱和密码不能为空"];
    } else {
        [self loginHandle];
    }
}

- (void)showErrorMessage:(NSString *)msg {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

- (void)loginHandle {
    NSString *email = self.emailTextField.text;
    NSString *password = self.passwordTextField.text;
    NSString *gbid = @"G2015020227";
    
    self.loginRequest = [[JYLoginRequest alloc]init];
    [self.loginRequest sendLoginRequestWithEmail:email password:password gbid:gbid delegate:self];
}

- (IBAction)touchDownAction:(id)sender {
    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)loginRequestSuccess:(JYLoginRequest *)request user:(JYUserModel *)user {
    if ([user.loginReturnMessage isEqualToString:@"Login success"]) {
        NSLog(@"登录成功，现在转换页面");
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [appDelegate loadMainViewWithController:self];
        [JYGlobal shareGlobal].user = user;
        [JYGlobal shareGlobal].user.email = self.emailTextField.text;
        JYGetImage *getImage = [[JYGetImage alloc]init];
        [getImage sendGetImageRequest];
    } else {
        NSLog(@"服务器错误:%@", user.loginReturnMessage);
    }
}

- (void)loginRequestFailed:(JYLoginRequest *)request error:(NSError *)error {
    NSLog(@"登录错误原因：%@", error);
}

@end
