//
//  FlickrPhoto.h
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrPhoto : NSObject
- (instancetype)initWithDict:(NSDictionary*)dict;
-(NSURL*)getImageURL:(NSString*)size;
@end
