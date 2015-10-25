//
//  JYRegisterRequest.m
//  JYMoran
//
//  Created by Joe on 10/25/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "JYRegisterRequest.h"
#import "BLMultipartForm.h"
#import "JYRegisterRequestParser.h"

@implementation JYRegisterRequest

- (void)sendRegisterRequestWithUserName:(NSString *)userName
                                  email:(NSString *)email
                               password:(NSString *)password
                                   gbid:(NSString *)gbid
                               delegate:(id<JYRegisterRequestDeleage>)delegate {
    [self.urlConnection cancel];
    
    self.delegate = delegate;
    NSString *urlString = @"http://moran.chinacloudapp.cn/moran/web/user/register";
    NSString *encodeString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    NSURL *url = [NSURL URLWithString:encodeString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    request.HTTPMethod = @"POST";
    request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    request.timeoutInterval = 60;
    BLMultipartForm *form = [[BLMultipartForm alloc]init];
    [form addValue:userName forField:@"username"];
    [form addValue:email forField:@"email"];
    [form addValue:password forField:@"password"];
    [form addValue:gbid forField:@"gbid"];
    request.HTTPBody = [form httpBody];
    [request setValue:form.contentType forHTTPHeaderField:@"Content-Type"];
    self.urlConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
}

#pragma Mark NSURLConnectionDataDelegate

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
    NSString *string = [[NSString alloc]initWithData:self.receivedData encoding:NSUTF8StringEncoding];
    NSLog(@"received string %@", string);
    JYRegisterRequestParser *parser = [[JYRegisterRequestParser alloc]init];
    JYUserModel *user = [parser parseJson:self.receivedData];
    
    if ([_delegate respondsToSelector:@selector(registerRequestSuccess:user:)]) {
        [_delegate registerRequestSuccess:self user:user];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"error: %@", error);
    if ([_delegate respondsToSelector:@selector(registerRequestFailed:error:)]) {
        [_delegate registerRequestFailed:self error:error];
    }
}

@end
