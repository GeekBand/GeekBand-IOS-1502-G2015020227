//
//  JYHeadImageViewController.h
//  JYMoran
//
//  Created by Joe on 11/3/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYEditImageRequest.h"

@interface JYHeadImageViewController : UIViewController<JYEditImageRequestDelegate, UIImagePickerControllerDelegate>
- (IBAction)doneButtonClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (strong, nonatomic) UIImagePickerController *pickerController;
- (IBAction)editHeadImageClicked:(id)sender;

@end
