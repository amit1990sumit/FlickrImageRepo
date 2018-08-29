//
//  ImageCollectionCell.m
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import "ImageCollectionCell.h"
#import "UIImageView+ImageCache.h"

@implementation ImageCollectionCell
-(void)configureImage:(FlickrPhoto*)photo{
    [self.imgView setImage:[UIImage imageNamed:@"placeholder"]];
    __weak __typeof(self) weakSelf = self;
    [self.imgView setImageWithURL1:[photo getImageURL:@"m"] completed:^(UIImage *image, NSError *error, NSURL *imageURL) {
        NSLog(@"Amit-test imageURL %@",imageURL);
            weakSelf.imgView.image = image;
    }];
}
@end
