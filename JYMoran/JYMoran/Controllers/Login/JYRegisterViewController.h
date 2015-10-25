//
//  JYRegisterViewController.h
//  JYMoran
//
//  Created by Joe on 10/25/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYRegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

- (IBAction)registerButtonClicked:(id)sender;
- (IBAction)loginButtonClicked:(id)sender;
- (IBAction)touchDownAction:(id)sender;



@end
