//
//  JYSquareRequestParser.h
//  JYMoran
//
//  Created by Joe on 11/7/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYSquareRequestParser : NSObject

@property (nonatomic, strong)NSMutableArray *addrArray;
@property (nonatomic, strong)NSMutableArray *pictureArrary;

- (NSDictionary *)parseJson:(NSData *)data;

@end
