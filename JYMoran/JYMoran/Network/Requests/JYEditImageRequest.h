//
//  JYEditImageRequest.h
//  JYMoran
//
//  Created by Joe on 11/5/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class JYEditImageRequest;

@protocol JYEditImageRequestDelegate<NSObject>

- (void)editImageRequestSuccess:(JYEditImageRequest *)request;
- (void)editImageRequestFailed:(JYEditImageRequest *)request error:(NSError *)error;

@end

@interface JYEditImageRequest : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, strong) id<JYEditImageRequestDelegate> delegate;

- (void)sendEditImageRequest:(UIImage *)image delegate:(id<JYEditImageRequestDelegate>)delegate;

@end
