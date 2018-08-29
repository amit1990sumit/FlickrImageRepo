//
//  ImageDownloaderManager.m
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import "ImageDownloaderManager.h"
#import "UIImageView+ImageCache.h"
#import "ImageDownloaderOperation.h"

@interface ImageDownloaderManager()
    @property (nonatomic, strong) NSOperationQueue *networkQueue;
    @property (nonatomic, strong) NSCache *imageCache;
@end
@implementation ImageDownloaderManager
+ (id)sharedManager {
    static dispatch_once_t once;
    static ImageDownloaderManager *instance;
    dispatch_once(&once, ^{
        instance = [self new];
        [instance configureNetworkQueue];
        instance.networkQueue = [[NSOperationQueue alloc] init];
        instance.imageCache = [[NSCache alloc] init];
    });
    return instance;
}
- (void)configureNetworkQueue{
    self.networkQueue.maxConcurrentOperationCount = 3;
}
-(void)downloadImageWithURL:(NSURL*)url withCompeltionBlock:(ImageCompletionBlockFinish)completedBlock{
    UIImage *image = nil;
    if(url != nil){
        image = [_imageCache objectForKey:[url absoluteString]];
    }
    if (image) {
        if(completedBlock){
           completedBlock(image,nil,url);
        }
    }
    else{
        ImageDownloaderOperation *operation = [[ImageDownloaderOperation alloc]initWithURL:url andImageCache:_imageCache withCompletionBlock:^(UIImage *image, NSError *error, NSURL *imageURL) {
            if (completedBlock) {
                completedBlock(image,error,imageURL);
            }
        }];
        [_networkQueue addOperation:operation];
    }
    
}

@end
