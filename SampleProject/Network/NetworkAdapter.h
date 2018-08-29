//
//  NetworkAdapter.h
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkAdapter : NSObject
+ (void)sendRequestWithURL:(NSURL *)URL
         completionHandler:(void (^)(NSData *responseString, NSString *errorMsg))completionHandler;
@end
