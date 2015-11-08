//
//  JYSquareRequestParser.m
//  JYMoran
//
//  Created by Joe on 11/7/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "JYSquareRequestParser.h"
#import "JYSquareModel.h"
#import "JYPictureModel.h"

@implementation JYSquareRequestParser

-(NSDictionary *)parseJson:(NSData *)data {
    NSError *error = nil;
    id jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    if (error) {
        NSLog(@"JYSquareRequestParser does not work.");
    } else {
        if ([[jsonDic class] isSubclassOfClass:[NSDictionary class]]) {
            id data = [[jsonDic valueForKey:@"data"] allValues];
            for (id dic in data) {
                self.addrArray = [NSMutableArray array];
                self.pictureArrary = [NSMutableArray array];
                JYSquareModel *squareModel = [[JYSquareModel alloc]init];
                [squareModel setValuesForKeysWithDictionary:dic[@"node"]];
                for (id picDict in dic[@"pic"]) {
                    JYPictureModel *picModel = [[JYPictureModel alloc]init];
                    [picModel setValuesForKeysWithDictionary:picDict];
                    [self.pictureArrary addObject:picModel];
                }
                [self.addrArray addObject:squareModel];
                [dictionary setObject:_pictureArrary forKey:_addrArray];
            }
        }
    }
    return dictionary;
}

@end
