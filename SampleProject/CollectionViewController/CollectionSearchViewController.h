//
//  CollectionSearchViewControllerCollectionViewController.h
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchTextView.h"
#import "FlickrService.h"

@interface CollectionSearchViewController : UICollectionViewController
@property (weak, nonatomic) IBOutlet SearchTextView *txtSearch;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (nonatomic,strong) NSMutableArray *collectionArray;
@property (nonatomic,assign) NSInteger currentPage;
@property (nonatomic,assign) NSInteger totalPages;

@end
