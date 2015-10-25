//
//  JYLoginRequestParser.h
//  JYMoran
//
//  Created by Joe on 10/23/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JYUserModel.h"

@interface JYLoginRequestParser : NSObject

- (JYUserModel *)parseJson:(NSData *)data;

@end
