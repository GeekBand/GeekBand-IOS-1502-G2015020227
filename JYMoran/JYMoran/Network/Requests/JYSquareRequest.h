//
//  JYSquareRequest.h
//  JYMoran
//
//  Created by Joe on 11/7/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JYSquareModel.h"

@class JYSquareRequest;

@protocol JYSquareRequestDelegate <NSObject>

- (void)squareRequestSuccess:(JYSquareRequest *)request dictionary:(NSDictionary *)dictionary;
- (void)squareRequestSuccess:(JYSquareRequest *)request squareModel:(JYSquareModel *)squareModel;
- (void)squareRequestFailed:(JYSquareRequest *)request error:(NSError *)error;

@end

@interface JYSquareRequest : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, assign) id<JYSquareRequestDelegate> delegate;

- (void)sendSquareRequestWithParamter:(NSDictionary *)paramDic delegate:(id<JYSquareRequestDelegate>)delegate;

@end
