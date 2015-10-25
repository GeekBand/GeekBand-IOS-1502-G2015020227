//
//  JYRegisterRequestParser.h
//  JYMoran
//
//  Created by Joe on 10/25/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JYUserModel.h"

@interface JYRegisterRequestParser : NSObject

- (JYUserModel *)parseJson:(NSData *)data;

@end
