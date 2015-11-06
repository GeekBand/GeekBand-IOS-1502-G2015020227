//
//  JYEditImageRequest.m
//  JYMoran
//
//  Created by Joe on 11/5/15.
//  Copyright © 2015 JY. All rights reserved.
//

#import "JYEditImageRequest.h"
#import "BLMultipartForm.h"
#import "JYGlobal.h"

@implementation JYEditImageRequest

- (void)sendEditImageRequest:(UIImage *)image delegate:(id<JYEditImageRequestDelegate>)delegate {
    [self.urlConnection cancel];
    self.delegate = delegate;
    
    NSURL *url = [NSURL URLWithString:@"http://moran.chinacloudapp.cn/moran/web/user/avatar"];
    NSData *data = UIImageJPEGRepresentation(image, 0.000001);
    BLMultipartForm *form = [[BLMultipartForm alloc]init];
    [form addValue:[JYGlobal shareGlobal].user.userId forField:@"user_id"];
    [form addValue:[JYGlobal shareGlobal].user.token forField:@"token"];
    [form addValue:data forField:@"data"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    request.HTTPMethod = @"POST";
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
    NSString *result = [[NSString alloc]initWithData:self.receivedData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", result);
    if ([_delegate respondsToSelector:@selector(editImageRequestSuccess:)]) {
        [_delegate editImageRequestSuccess:self];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Error: %@", error);
    if ([_delegate respondsToSelector:@selector(editImageRequestFailed:error:)]) {
        [_delegate editImageRequestFailed:self error:error];
    }
}

@end
