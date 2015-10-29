//
//  JYGlobal.m
//  JYMoran
//
//  Created by Joe on 10/29/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "JYGlobal.h"

static JYGlobal *global = nil;

@implementation JYGlobal

+ (JYGlobal *)shareGlobal {
    if (global == nil) {
        global = [[JYGlobal alloc]init];
    }
    return global;
}

@end
