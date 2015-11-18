//
//  JYPublishRequest.h
//  JYMoran
//
//  Created by joeyu on 11/18/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JYPublishRequest;

@protocol JYPublishRequestDelegate <NSObject>

- (void)requestSuccess:(JYPublishRequest *)request picId:(NSString *)picId;
- (void)requestFailed:(JYPublishRequest *)request error:(NSError *)error;

@end

@interface JYPublishRequest : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, assign) id<JYPublishRequestDelegate> delegate;

- (void)sendPublishRequestWithUserId:(NSString *)userId
                               token:(NSString *)token
                           longitude:(NSString *)longitude
                            latitude:(NSString *)latitude
                               title:(NSString *)title
                                data:(NSData *)data
                            location:(NSString *)location
                            delegate:(id<JYPublishRequestDelegate>)delegate;

@end
