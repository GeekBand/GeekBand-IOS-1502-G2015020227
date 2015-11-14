//
//  JYViewDetailController.h
//  JYMoran
//
//  Created by Joe on 11/7/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYViewDetailRequest.h"

@interface JYViewDetailController : UIViewController<UITableViewDataSource, UITableViewDelegate, JYViewDetailRequestDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *photoImage;
@property (nonatomic, copy) NSString *pic_id;
@property (nonatomic, copy) NSString *pic_url;
@property (nonatomic, copy) NSArray *commentArrary;

@end
