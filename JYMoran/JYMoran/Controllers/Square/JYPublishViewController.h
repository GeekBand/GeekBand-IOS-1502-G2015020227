//
//  JYPublishViewController.h
//  JYMoran
//
//  Created by joeyu on 11/15/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "JYLocationModel.h"

@interface JYPublishViewController : UIViewController <UITextViewDelegate, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *locationButton;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) NSMutableDictionary *dic;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) JYLocationModel *locationModel;

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIControl *blackView;
@property (strong, nonatomic) UIImagePickerController *pickerController;
- (IBAction)locationButtonClicked:(id)sender;

- (IBAction)touchDown:(id)sender;
- (IBAction)publishLocation:(id)sender;
- (IBAction)returnToCamera:(id)sender;

@end
