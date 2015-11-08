//
//  JYSquareRequest.m
//  JYMoran
//
//  Created by Joe on 11/7/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "JYSquareRequest.h"
#import "JYSquareRequestParser.h"

@implementation JYSquareRequest

- (void)sendSquareRequestWithParamter:(NSDictionary *)paramDic delegate:(id<JYSquareRequestDelegate>)delegate {
    [self.urlConnection cancel];
    self.delegate = delegate;
    
    NSString *urlString = [NSString stringWithFormat:@"http://moran.chinacloudapp.cn/moran/web/node/list?distance=%@&latitude=%@&longitude=%@&token=%@&user_id=%@", paramDic[@"distance"], paramDic[@"latitude"], paramDic[@"longitude"], paramDic[@"token"], paramDic[@"user_id"]];
    NSString *encodedURLString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:encodedURLString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    request.HTTPMethod = @"GET";
    request.timeoutInterval = 60;
    request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    
    self.urlConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
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
    NSString *result = [[NSString alloc]initWithData:self.receivedData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", result);
    
    JYSquareRequestParser *parser = [[JYSquareRequestParser alloc]init];
    if ([_delegate respondsToSelector:@selector(squareRequestSuccess:dictionary:)]) {
        [_delegate squareRequestSuccess:self dictionary:[parser parseJson:self.receivedData]];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"JYSquareRequest.Error: %@", error);
    if ([_delegate respondsToSelector:@selector(squareRequestFailed:error:)]) {
        [_delegate squareRequestFailed:self error:error];
    }
}

@end
