//
//  UIImageView+ImageCache.m
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import "UIImageView+ImageCache.h"
#import "ImageDownloaderManager.h"
#import <objc/runtime.h>
static void *kAssociatedObjectKey = &kAssociatedObjectKey;
@implementation UIImageView(ImageCache)
- (void)setImageWithURL1:(NSURL *)url completed:(ImageCacheCompletionBlock)completedBlock{
    objc_setAssociatedObject(self, kAssociatedObjectKey, url, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [[ImageDownloaderManager sharedManager] downloadImageWithURL:url withCompeltionBlock:^(UIImage *image, NSError *error, NSURL *imageURL) {
        if(completedBlock){
            if ([[imageURL absoluteString] isEqualToString:[[self getImageURL] absoluteString]]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completedBlock(image,error,imageURL);
                });
            }
        }
    }];
}
- (NSURL *)getImageURL {
    return objc_getAssociatedObject(self, kAssociatedObjectKey);
}
@end
