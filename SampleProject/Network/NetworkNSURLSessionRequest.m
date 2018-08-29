//
//  NetworkNSURLSessionRequest.m
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import "NetworkNSURLSessionRequest.h"
@interface NetworkNSURLSessionRequest()
@property(nonatomic, strong) NSURLSession *session;
@end
@implementation NetworkNSURLSessionRequest
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        configuration.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
        configuration.timeoutIntervalForResource = 30;
        _session = [NSURLSession sessionWithConfiguration:configuration];
    }
    return self;
}
- (void)handleRequest:(NSURLRequest *)request completionHandler:(void (^)(NSData *, NSURLResponse *, NSError *))completionHandler {
    [[self->_session dataTaskWithRequest:request completionHandler:completionHandler] resume];
}


@end
