//
//  CollectionSearchViewControllerCollectionViewController.m
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import "CollectionSearchViewController.h"
#import "ImageCollectionCell.h"
#import "CollectionSearchViewController+Service.h"
#import "CollectionSearchViewController+CollectionViewDelegate.h"
static NSString * const reuseIdentifier = @"ImageCell";
@interface CollectionSearchViewController ()
@end

@implementation CollectionSearchViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self textFieldShouldReturn];
    [[ImageServieManager sharedInstance]setService:@"flickr" withOptions:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}






@end
