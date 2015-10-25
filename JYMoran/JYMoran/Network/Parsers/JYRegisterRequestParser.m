//
//  JYRegisterRequestParser.m
//  JYMoran
//
//  Created by Joe on 10/25/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "JYRegisterRequestParser.h"

@implementation JYRegisterRequestParser

- (JYUserModel *)parseJson:(NSData *)data {
    NSError *error = nil;
    id jsonDic = [NSJSONSerialization JSONObjectWithData:data
                                                 options:NSJSONReadingAllowFragments
                                                   error:&error];
    if (error) {
        NSLog(@"parse is not work!");
    } else {
        if ([[jsonDic class] isSubclassOfClass:[NSDictionary class]]) {
            id returnMessage = [jsonDic valueForKey:@"message"];
            if ([[returnMessage class] isSubclassOfClass:[NSString class]]) {
                JYUserModel *user = [[JYUserModel alloc]init];
                user.registerReturnMessage = returnMessage;
                return user;
            }
        }
    }
    
    return nil;
}

@end
