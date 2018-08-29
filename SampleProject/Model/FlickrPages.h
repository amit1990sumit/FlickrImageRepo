//
//  FlickrPages.h
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrPages : NSObject

- (instancetype)initWithDict:(NSDictionary*)dict;
-(NSInteger)page;
-(NSMutableArray *)photosItemArray;
-(NSInteger)totalPageAvailable;
@end
