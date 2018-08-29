//
//  ImageDownloaderManager.h
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ImageCompletionBlockFinish)(UIImage *image, NSError *error, NSURL *imageURL);

@interface ImageDownloaderManager : NSObject

+ (id)sharedManager;
-(void)downloadImageWithURL:(NSURL*)url withCompeltionBlock:(ImageCompletionBlockFinish)completedBlock;
@end
