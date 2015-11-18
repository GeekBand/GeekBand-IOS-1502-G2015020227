//
//  JYPublishRequestParser.m
//  JYMoran
//
//  Created by joeyu on 11/18/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "JYPublishRequestParser.h"

@implementation JYPublishRequestParser

- (JYPublishModel *)parseJson:(NSData *)data {
    NSError *error = nil;
    id jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    if (error) {
        NSLog(@"Error in JYPublishRequestParser");
    } else {
        if ([[jsonDic class] isSubclassOfClass:[NSDictionary class]]) {
            id returnMessage = [jsonDic valueForKey:@"data"];
            id returnPic = [returnMessage valueForKey:@"pic_id"];
            if ([[returnPic class] isSubclassOfClass:[NSString class]]) {
                JYPublishModel *model = [[JYPublishModel alloc]init];
                model.picId = returnPic;
                return model;
            }
        }
    }
    
    return nil;
}

@end
