//
//  JYLocationParser.m
//  JYMoran
//
//  Created by joeyu on 11/23/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "JYLocationParser.h"

@implementation JYLocationParser

- (JYLocationModel *)parseJson:(NSData *)data {
    NSError *error = nil;
    id jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
 
    if (error) {
        NSLog(@"JYLocationParser");
    } else {
        if ([[jsonDic class] isSubclassOfClass:[NSDictionary class]]) {
            JYLocationModel *model = [[JYLocationModel alloc]init];
            model.nameArray = [NSMutableArray array];
            model.addrArray = [NSMutableArray array];
            for (id addr in [jsonDic valueForKey:@"addrList"]) {
                [model.nameArray addObject:[addr valueForKey:@"admName"]];
                [model.addrArray addObject:[addr valueForKey:@"name"]];
            }
            return model;
        }
    }
    
    return nil;
}

@end
