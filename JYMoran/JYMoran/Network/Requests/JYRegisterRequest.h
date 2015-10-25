//
//  JYRegisterRequest.h
//  JYMoran
//
//  Created by Joe on 10/25/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JYUserModel.h"

@class JYRegisterRequest;

@protocol JYRegisterRequestDeleage <NSObject>

- (void)registerRequestSuccess:(JYRegisterRequest *)request user:(JYUserModel *)user;
- (void)registerRequestFailed:(JYRegisterRequest *)request error:(NSError *)error;

@end

@interface JYRegisterRequest: NSObject<NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, strong) id<JYRegisterRequestDeleage> delegate;

- (void)sendRegisterRequestWithUserName:(NSString *)userName email:(NSString *)email password:(NSString *)password gbid:(NSString *)gbid delegate:(id<JYRegisterRequestDeleage>)delegate;

@end
