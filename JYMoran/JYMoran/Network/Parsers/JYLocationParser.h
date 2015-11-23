//
//  JYLocationParser.h
//  JYMoran
//
//  Created by joeyu on 11/23/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JYLocationModel.h"

@interface JYLocationParser : NSObject

- (JYLocationModel *)parseJson:(NSData *)data;

@end
