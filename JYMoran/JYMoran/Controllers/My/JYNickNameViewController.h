//
//  JYNickNameViewController.h
//  JYMoran
//
//  Created by Joe on 11/3/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYEditNickNameRequest.h"

@interface JYNickNameViewController : UIViewController<JYEditNickNameRequestDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nickNameTextField;
@property (nonatomic, weak) NSString *nickName;
- (IBAction)doneBarButtonClicked:(id)sender;

@end
