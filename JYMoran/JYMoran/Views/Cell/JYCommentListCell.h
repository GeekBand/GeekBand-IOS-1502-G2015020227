//
//  JYCommentListCell.h
//  JYMoran
//
//  Created by joeyu on 11/14/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYCommentListCell : UITableViewCell

@property (nonatomic, retain) UILabel *userNameOfComment;
@property (nonatomic, retain) UILabel *textOfComment;
@property (nonatomic, retain) UIImageView *headImageOfComment;
@property (nonatomic, retain) UILabel *dateOfComment;

@end
