//
//  JYPublishViewController.h
//  JYMoran
//
//  Created by joeyu on 11/15/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface JYPublishViewController : UIViewController <UITextViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) NSMutableDictionary *dic;
@property (strong, nonatomic) CLLocationManager *locationManager;
- (IBAction)touchDown:(id)sender;

@end
