//
//  JYViewDetailRequestParser.m
//  JYMoran
//
//  Created by joeyu on 11/14/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "JYViewDetailRequestParser.h"
#import "JYViewDetailModel.h"

@implementation JYViewDetailRequestParser

- (NSArray *)parseJson:(NSData *)data {
    NSError *error = nil;
    NSMutableArray *array = nil;

    id jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    if (error) {
        NSLog(@"JYViewDetailRequestParser");
    } else {
        if ([[jsonDic class]isSubclassOfClass:[NSDictionary class]]) {
            array = [[NSMutableArray alloc]init];
            id data = [jsonDic valueForKey:@"data"];
            for (id dic in data) {
                JYViewDetailModel *model = [[JYViewDetailModel alloc]init];
                [model setValuesForKeysWithDictionary:dic];
                [array addObject:model];
            }
        }
    }
    
    return array;
}

@end
