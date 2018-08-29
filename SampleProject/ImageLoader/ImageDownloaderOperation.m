//
//  ImageDownloaderOperation.m
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import "ImageDownloaderOperation.h"
#import "UIImageView+ImageCache.h"
#import "NetworkAdapter.h"

@interface ImageDownloaderOperation(){
    NSCache *_imageCache;
    NSURL *_imageURL;
}
@property (assign, nonatomic)BOOL _isExecuting;
@property (assign, nonatomic)BOOL _isFinished;
@property (copy, nonatomic) ImageOperationCompletionBlock imageCompletionBlock;
@end
@implementation ImageDownloaderOperation

-(instancetype)initWithURL:(NSURL*)url andImageCache:(NSCache*)imageCache withCompletionBlock:(ImageOperationCompletionBlock)completionBlock{
    
    self = [super init];
    if (self) {
        _imageURL = url;
        _imageCompletionBlock = completionBlock;
        _imageCache = imageCache;
        
    }
    return self;
}
- (BOOL)isConcurrent {
    return YES;
}
- (BOOL)isExecuting
{
    // any thread
    return self._isExecuting;
}

- (BOOL)isFinished
{
    // any thread
    return self._isFinished;
}
-(void)cancel{
    
}

-(void)start{
    if ([self isCancelled]) {
        [self willChangeValueForKey:@"isFinished"];
        self._isFinished = YES;
        [self didChangeValueForKey:@"isFinished"];
        return;
    }
    [self willChangeValueForKey:@"isExecuting"];
    self._isExecuting = YES;
    UIImage *image = nil;
    if(_imageURL != nil){
        image = [_imageCache objectForKey:[_imageURL absoluteString]];
    }
    if (image) {
        if(self->_imageCompletionBlock){
            self->_imageCompletionBlock(image,nil,self->_imageURL);
        }
        [self requestFinished];
    }
    else{
        [NetworkAdapter sendRequestWithURL:_imageURL completionHandler:^(NSData *responseData, NSString *errorMsg) {
            UIImage *image = [UIImage imageWithData:responseData];
            if (image) {
                [self->_imageCache setObject:image forKey:[self->_imageURL absoluteString]];
            }
            if(self->_imageCompletionBlock){
                self->_imageCompletionBlock(image,nil,self->_imageURL);
            }
            [self requestFinished];
        }];
    }
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)requestFinished {
    [self willChangeValueForKey:@"isExecuting"];
    [self willChangeValueForKey:@"isFinished"];
    self._isExecuting = NO;
    self._isFinished = YES;
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}

@end
