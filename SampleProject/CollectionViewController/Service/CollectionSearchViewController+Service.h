//
//  CollectionSearchViewController+Service.h
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CollectionSearchViewController.h"
typedef void(^NetworkCallCompleted)(void);
@interface CollectionSearchViewController(Service)
-(void)callFlickrSearchServiceWithString:(NSString*)strSearch andPageNo:(NSInteger)page withCompletionBlock:(NetworkCallCompleted)completed;
@end
