//
//  ImageDownloaderOperation.h
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^ImageOperationCompletionBlock)(UIImage *image, NSError *error, NSURL *imageURL);
@interface ImageDownloaderOperation : NSOperation
-(instancetype)initWithURL:(NSURL*)url andImageCache:(NSCache*)imageCache withCompletionBlock:(ImageOperationCompletionBlock)completionBlock;
@end
