//
//  ImageServieManager.m
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import "ImageServieManager.h"
#import "ImageServiceDelegate.h"
#import "FlickrService.h"

@interface ImageServieManager(){
    id <ImageServiceDelegate> _delegate;
}
@end
@implementation ImageServieManager

+(instancetype)sharedInstance{
    static ImageServieManager *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc]init];
    });
    return _sharedInstance;
}
-(void)setService:(NSString*)type withOptions:(NSDictionary*)launchOption{
    if ([type isEqualToString:@"flickr"]) {
       _delegate = [[FlickrService alloc] init];
    }
}
-(void)callSearchAPI:(NSString*)strSearch andPageNo:(NSInteger)page :(FlickrRequestCompleted)completion{
    [_delegate searchWithString:strSearch andPageNo:page withCompletionBlock:^(FlickrPages *flickrPages) {
        if(completion){
            completion(flickrPages);
        }
    }];
        
    
}

@end
