//
//  JYSquareCell.m
//  JYMoran
//
//  Created by Joe on 11/7/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "JYSquareCell.h"
#import "JYSquareCollectionCell.h"
#import "JYPictureModel.h"

@implementation JYSquareCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
    }
    
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JYSquareCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    JYPictureModel *pictureModel = self.dataArr[indexPath.row];
    NSString *pic = pictureModel.pic_link;
    pic = [pic stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *pic_url = [NSURL URLWithString:pic];
    [cell.pictureImageView sd_setImageWithURL:pic_url];
    cell.titleLabel.text = pictureModel.title;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%zd", indexPath.row);
    JYPictureModel *pictureModel = self.dataArr[indexPath.row];
    self.squareVC.pic_url = pictureModel.pic_link;
    self.squareVC.pic_id = pictureModel.pic_id;
    [self.squareVC toCheckPicture];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
