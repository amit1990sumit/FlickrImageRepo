//
//  CollectionSearchViewController+CollectionViewDelegate.m
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import "CollectionSearchViewController+CollectionViewDelegate.h"
#import "ImageCollectionCell.h"
#import "CollectionSearchViewController+Service.h"
#import "UIImageView+ImageCache.h"
#import "FlickrPhoto.h"

#define COLUMNS 3.2

static NSString * const reuseIdentifier = @"ImageCell";
@implementation CollectionSearchViewController(CollectionViewDelegate)
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.collectionArray count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    FlickrPhoto *photo = [self.collectionArray objectAtIndex:indexPath.row];
    [cell configureImage:photo];
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger size = (collectionView.bounds.size.width)/COLUMNS;
    return CGSizeMake(size, size);
}
#pragma mark <UICollectionViewDelegate>

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{    
    float scrollViewHeight = scrollView.frame.size.height;
    float scrollContentSizeHeight = scrollView.contentSize.height;
    float scrollOffset = scrollView.contentOffset.y;
    
    if (scrollOffset + scrollViewHeight == scrollContentSizeHeight && self.currentPage < self.totalPages)
    {
        [self callFlickrSearchServiceWithString:self.txtSearch.text andPageNo:self.currentPage+1];
    }
    
}

-(void)textFieldShouldReturn{
    __weak __typeof(self) weakSelf = self;
    self.txtSearch.textFieldShouldReturnBlock = ^(UITextField *textField) {
        [weakSelf.txtSearch endEditing:YES];
        weakSelf.collectionArray = [[NSMutableArray alloc] init];
        [weakSelf callFlickrSearchServiceWithString:textField.text andPageNo:1];
    };
}

@end
