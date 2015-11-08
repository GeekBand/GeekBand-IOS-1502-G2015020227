//
//  JYSquareViewController.h
//  JYMoran
//
//  Created by Joe on 11/7/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYSquareRequest.h"

@interface JYSquareViewController : UIViewController <JYSquareRequestDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *addrArray;
@property (nonatomic, strong) NSDictionary *dataDic;
@property (weak, nonatomic) UIButton *titleButton;

@property (nonatomic, strong) NSString *pic_url;
@property (nonatomic, strong) NSString *pic_id;

@end
