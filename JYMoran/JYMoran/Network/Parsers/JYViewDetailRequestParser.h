//
//  JYViewDetailRequestParser.h
//  JYMoran
//
//  Created by joeyu on 11/14/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYViewDetailRequestParser : NSObject

- (NSArray *)parseJson:(NSData *)data;

@end
