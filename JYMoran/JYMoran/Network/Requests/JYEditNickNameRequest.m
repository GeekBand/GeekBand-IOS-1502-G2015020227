//
//  JYEditNickNameRequest.m
//  JYMoran
//
//  Created by Joe on 11/4/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "JYEditNickNameRequest.h"
#import "BLMultipartForm.h"
#import "JYGlobal.h"

@implementation JYEditNickNameRequest

- (void)sendEditNickNameRequest:(NSString *)nickName delegate:(id<JYEditNickNameRequestDelegate>)delegate {
    [self.urlConnection cancel];
    self.delegate = delegate;
    
    NSURL *url = [NSURL URLWithString:@"http://moran.chinacloudapp.cn/moran/web/user/rename"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    request.HTTPMethod = @"POST";
    BLMultipartForm *form = [[BLMultipartForm alloc]init];
    [form addValue:[JYGlobal shareGlobal].user.userId forField:@"user_id"];
    [form addValue:[JYGlobal shareGlobal].user.token forField:@"token"];
    [form addValue:nickName forField:@"new_name"];
    request.HTTPBody = [form httpBody];
    [request setValue:form.contentType forHTTPHeaderField:@"Content-Type"];
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
    NSString *string = [[NSString alloc]initWithData:self.receivedData encoding:NSUTF8StringEncoding];
    NSLog(@"rename data string %@", string);
    if ([_delegate respondsToSelector:@selector(editNickNameRequestSuccess:)]) {
        [_delegate editNickNameRequestSuccess:self];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Error: %@", error);
    if ([_delegate respondsToSelector:@selector(editNickNameRequestFailed:error:)]) {
        [_delegate editNickNameRequestFailed:self error:error];
    }
}

@end
