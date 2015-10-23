//
//  LoginAndRegisterViewController.h
//  JYMoran
//
//  Created by Joe on 10/21/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginAndRegisterViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)loginButtonClicked:(id)sender;
- (IBAction)touchDownAction:(id)sender;

@end
