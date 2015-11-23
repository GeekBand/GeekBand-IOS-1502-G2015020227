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
            
            JYSquareRequestParser *weakSelf = self;
            
            for (id dic in data) {
                weakSelf.addrArray = [NSMutableArray array];
                weakSelf.pictureArrary = [NSMutableArray array];
                JYSquareModel *squareModel = [[JYSquareModel alloc]init];
                [squareModel setValuesForKeysWithDictionary:dic[@"node"]];
                for (id picDict in dic[@"pic"]) {
                    JYPictureModel *picModel = [[JYPictureModel alloc]init];
                    [picModel setValuesForKeysWithDictionary:picDict];
                    [weakSelf.pictureArrary addObject:picModel];
                }
                [weakSelf.addrArray addObject:squareModel];
                [dictionary setObject:_pictureArrary forKey:_addrArray];
            }
        }
    }
    return dictionary;
}

@end
