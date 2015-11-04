//
//  JYGetImage.m
//  JYMoran
//
//  Created by Joe on 11/4/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "JYGetImage.h"
#import "JYGlobal.h"

@implementation JYGetImage

- (void)sendGetImageRequest {
    [self.urlConnection cancel];
    
    NSString *urlString = @"http://moran.chinacloudapp.cn/moran/web/user/show";
    urlString = [NSString stringWithFormat:@"%@?user_id=%@", urlString, [JYGlobal shareGlobal].user.userId];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    request.HTTPMethod = @"GET";
    self.urlConnection = [[NSURLConnection alloc]initWithRequest:request delegate:nil startImmediately:YES];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if (httpResponse.statusCode == 200) {
        self.receivedData = [NSMutableData data];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [JYGlobal shareGlobal].user.image = [[UIImage alloc]initWithData:self.receivedData];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Error: %@", error);
}

@end
