//
//  CollectionSearchViewController+Service.m
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import "CollectionSearchViewController+Service.h"
#import "FlickrPages.h"
#import "ImageServieManager.h"

@implementation CollectionSearchViewController(Service)

-(void)callFlickrSearchServiceWithString:(NSString*)strSearch andPageNo:(NSInteger)page{
    __weak __typeof(self) weakSelf = self;
    [[ImageServieManager sharedInstance] callSearchAPI:strSearch andPageNo:page :^(FlickrPages *flickrPages) {
        [weakSelf.collectionArray addObjectsFromArray:flickrPages.photosItemArray];
        weakSelf.currentPage = flickrPages.page;
        weakSelf.totalPages = flickrPages.totalPageAvailable;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.collectionView reloadData];
        });
    }];
}


@end
