//
//  JYEditNickNameRequest.h
//  JYMoran
//
//  Created by Joe on 11/4/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JYEditNickNameRequest;

@protocol JYEditNickNameRequestDelegate <NSObject>

- (void)editNickNameRequestSuccess:(JYEditNickNameRequest *)request;
- (void)editNickNameRequestFailed:(JYEditNickNameRequest *)request error:(NSError *)error;

@end

@interface JYEditNickNameRequest : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, strong) id<JYEditNickNameRequestDelegate> delegate;

- (void)sendEditNickNameRequest:(NSString *)nickName delegate:(id<JYEditNickNameRequestDelegate>)delegate;

@end
