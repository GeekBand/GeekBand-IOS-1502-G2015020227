//
//  JYGetImage.h
//  JYMoran
//
//  Created by Joe on 11/4/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JYUserModel.h"

@interface JYGetImage : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSMutableData *receivedData;

- (void)sendGetImageRequest;

@end
