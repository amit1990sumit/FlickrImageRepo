//
//  ImageServiceDelegate.h
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//
#import "ImageServieManager.h"
@protocol ImageServiceDelegate <NSObject>
-(void)searchWithString:(NSString*)strSearch andPageNo:(NSInteger)page withCompletionBlock:(FlickrRequestCompleted)completion;
@end
