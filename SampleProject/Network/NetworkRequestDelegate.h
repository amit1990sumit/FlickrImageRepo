//
//  NetworkSessionRequestDelegate.h
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//
@protocol NetworkRequestDelegate <NSObject>
- (void)handleRequest:(NSURLRequest *)request
    completionHandler:(void(^)(NSData *responseData, NSURLResponse *response, NSError *error))completionHandler;
@end

