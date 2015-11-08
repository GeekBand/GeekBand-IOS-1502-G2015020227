//
//  JYSquareCell.h
//  JYMoran
//
//  Created by Joe on 11/7/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYSquareViewController.h"
#import "UIImageView+WebCache.h"

@interface JYSquareCell : UITableViewCell<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) JYSquareViewController *squareVC;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (nonatomic, strong) NSArray *dataArr;

@end
