//
//  JYViewDetailRequest.h
//  JYMoran
//
//  Created by joeyu on 11/14/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JYViewDetailRequest;

@protocol JYViewDetailRequestDelegate <NSObject>

- (void)viewDetailRequestSuccess:(JYViewDetailRequest *)request data:(NSArray *)data;
- (void)viewDetailRequestFailed:(JYViewDetailRequest *)request error:(NSError *)error;

@end

@interface JYViewDetailRequest : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, assign) id<JYViewDetailRequestDelegate> delegate;

- (void)sendViewDetailRequest:(NSDictionary *)paramDic delegate:(id<JYViewDetailRequestDelegate>) delegate;

@end
