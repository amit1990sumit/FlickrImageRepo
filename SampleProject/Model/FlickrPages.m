//
//  FlickrPages.m
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import "FlickrPages.h"
#import "FlickrPhoto.h"
@interface FlickrPages()
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger totalPageAvailable;
@property (nonatomic, assign) NSInteger numberOfItems;
@property (nonatomic, strong) NSString* total;
@property (nonatomic, retain) NSMutableArray *photosItemArray;
@end
@implementation FlickrPages

- (instancetype)initWithDict:(NSDictionary*)dict;{
    self = [super init];
    if (self) {
        self.page = [[dict valueForKeyPath:@"photos.page"] integerValue];
        self.totalPageAvailable = [[dict valueForKeyPath:@"photos.pages"] integerValue];
        self.numberOfItems = [[dict valueForKeyPath:@"photos.perpage"] integerValue];
        _photosItemArray = [[NSMutableArray alloc] init];
        [self setPhotoModel:[dict valueForKeyPath:@"photos.photo"]];
    }
    return self;
}
-(void)setPhotoModel:(NSOrderedSet*)set{
    for (NSDictionary *dict in set) {
        FlickrPhoto *photo = [[FlickrPhoto alloc] initWithDict:dict];
        [self.photosItemArray addObject:photo];
    }
}
- (NSInteger)page{
    return _page;
}
-(NSMutableArray *)photosItemArray{
    return _photosItemArray;
}
-(NSInteger)totalPageAvailable{
    return _totalPageAvailable;
}
@end
