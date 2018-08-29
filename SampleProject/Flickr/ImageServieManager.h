//
//  ImageServieManager.h
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlickrPages.h"

@interface ImageServieManager : NSObject
typedef void(^FlickrRequestCompleted)(FlickrPages *flickrPages);
+(instancetype)sharedInstance;
-(void)setService:(NSString*)type withOptions:(NSDictionary*)launchOption;
-(void)callSearchAPI:(NSString*)strSearch andPageNo:(NSInteger)page :(FlickrRequestCompleted)completion;
@end
