//
//  JYPublishViewController.h
//  JYMoran
//
//  Created by joeyu on 11/15/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYPublishViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
