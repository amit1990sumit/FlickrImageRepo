//
//  UIImageView+ImageCache.h
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ImageCacheCompletionBlock)(UIImage *image, NSError *error, NSURL *imageURL);
@interface UIImageView (ImageCache)
- (void)setImageWithURL1:(NSURL *)url completed:(ImageCacheCompletionBlock)completedBlock;
@end
