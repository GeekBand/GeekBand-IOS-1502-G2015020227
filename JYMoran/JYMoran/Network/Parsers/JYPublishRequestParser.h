//
//  JYPublishRequestParser.h
//  JYMoran
//
//  Created by joeyu on 11/18/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JYPublishModel.h"

@interface JYPublishRequestParser : NSObject

- (JYPublishModel *)parseJson:(NSData *)data;

@end
