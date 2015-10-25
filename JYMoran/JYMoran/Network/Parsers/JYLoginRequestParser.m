//
//  JYLoginRequestParser.m
//  JYMoran
//
//  Created by Joe on 10/23/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "JYLoginRequestParser.h"

@implementation JYLoginRequestParser

- (JYUserModel *)parseJson:(NSData *)data {
    NSError *error = nil;
    id jsonDic = [NSJSONSerialization JSONObjectWithData:data
                                                 options:NSJSONReadingAllowFragments
                                                   error:&error];
    if (error) {
        NSLog(@"Error in JYLoginRequestParser.parseJson");
    } else {
        if ([[jsonDic class] isSubclassOfClass:[NSDictionary class]]) {
            id returnMessage = [jsonDic valueForKey:@"message"];
            if ([[returnMessage class] isSubclassOfClass:[NSString class]]) {
                JYUserModel *user = [[JYUserModel alloc]init];
                user.loginReturnMessage = returnMessage;
                return user;
            }
        }
    }
    
    return nil;
}

@end
