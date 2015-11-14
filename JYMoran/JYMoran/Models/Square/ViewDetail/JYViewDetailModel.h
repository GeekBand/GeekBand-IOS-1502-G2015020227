//
//  JYViewDetailModel.h
//  JYMoran
//
//  Created by joeyu on 11/14/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYViewDetailModel : NSObject

@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *modified;

- (void)setValue:(id)value forUndefinedKey:(nonnull NSString *)key;

@end
