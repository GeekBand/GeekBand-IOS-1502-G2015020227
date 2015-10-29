//
//  JYGlobal.h
//  JYMoran
//
//  Created by Joe on 10/29/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JYUserModel.h"

@interface JYGlobal : NSObject

@property (nonatomic, strong)JYUserModel *user;

+ (JYGlobal *)shareGlobal;

@end
