//
//  JYLoginRequest.h
//  JYMoran
//
//  Created by Joe on 10/23/15.
//  Copyright © 2015 JY. All rights reserved.
//
@class JYLoginRequest;

#import "JYUserModel.h"
#import <Foundation/Foundation.h>

@protocol JYLoginRequestDelegate <NSObject>

- (void)loginRequestSuccess:(JYLoginRequest *)request user:(JYUserModel *)user;
- (void)loginRequestFailed:(JYLoginRequest *)request error:(NSError *)error;

@end

@interface JYLoginRequest : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, assign) id<JYLoginRequestDelegate> delegate;

- (void)sendLoginRequestWithEmail:(NSString *)email
                         password:(NSString *)password
                             gbid:(NSString *)gbid
                         delegate:(id<JYLoginRequestDelegate>)delegate;

@end