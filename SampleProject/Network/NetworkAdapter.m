//
//  NetworkAdapter.m
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import "NetworkAdapter.h"
#import "NetworkRequestDelegate.h"
#import "NetworkNSURLSessionRequest.h"
@interface NetworkAdapter ()
@property(nonatomic, strong) NSURLSession *session;
@end
@implementation NetworkAdapter
+ (id <NetworkRequestDelegate>)defaultDelegate {
    static dispatch_once_t predicate;
    static id <NetworkRequestDelegate> delegate;
    dispatch_once(&predicate, ^{
        if ([NSURLSession class]) {
            delegate = [[NetworkNSURLSessionRequest alloc] init];
        }
    });
    return delegate;
}

+ (void)sendRequestWithURL:(NSURL *)URL
 completionHandler:(void (^)(NSData *responseString, NSString *errorMsg))completionHandler {
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = @"GET";
    
    id <NetworkRequestDelegate> delegate;
    if (delegate == nil) {
        delegate = [self defaultDelegate];
    }
    [delegate handleRequest:request completionHandler:^(NSData *responseData, NSURLResponse __unused *response, NSError *error) {
        if (!completionHandler) {
            return;
        }
        if (error) {
            completionHandler(nil, @"error");
            return;
        }
        completionHandler(responseData, nil);
    }];
}

@end
