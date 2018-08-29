//
//  FlickrPhoto.m
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import "FlickrPhoto.h"

@interface FlickrPhoto()
@property (nonatomic, strong) NSString * photoID;
@property (nonatomic, strong) NSString * photoOwner;
@property (nonatomic, strong) NSString * photoSecret;
@property (nonatomic, strong) NSString * photoServer;
@property (nonatomic, assign) NSInteger photoFarm;
@property (nonatomic, strong) NSString * photoTitle;
@end
@implementation FlickrPhoto

- (instancetype)initWithDict:(NSDictionary*)dict
{
    self = [super init];
    if (self) {
        self.photoID = [dict valueForKey:@"id"];
        self.photoFarm = [[dict valueForKey:@"farm"] integerValue];
        self.photoServer = [dict valueForKey:@"server"];
        self.photoSecret = [dict valueForKey:@"secret"];
    }
    return self;
}
-(NSURL*)getImageURL:(NSString*)size{
    NSString *url = [NSString stringWithFormat:@"https://farm%ld.staticflickr.com/%@/%@_%@_%@.jpg",_photoFarm,_photoServer,_photoID,_photoSecret,size];
    return [NSURL URLWithString:url];
}

@end
