//
//  FlickrService.m
//  SampleProject
//
//  Created by Amit Kumar namdev on 29/08/18.
//  Copyright © 2018 Amit Kumar namdev. All rights reserved.
//

#import "FlickrService.h"
#import "NetworkAdapter.h"
#import "FlickrPages.h"
#import "ImageServieManager.h"

const NSString *apiKey = @"6e2e725df89a7df7a7de7c01b80ee65e";
const NSString *BASE_URL = @"https://api.flickr.com/services/rest";
@interface FlickrService(){
    FlickrRequestCompleted _completionBlock;
}
@end

@implementation FlickrService
-(void)searchWithString:(NSString*)strSearch andPageNo:(NSInteger)page withCompletionBlock:(FlickrRequestCompleted)completion{
    _completionBlock = completion;
    [self callSearchAPI:strSearch andPageNo:page];
}
-(void)callSearchAPI:(NSString*)strSearch andPageNo:(NSInteger)page{
    NSString *strURL = [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&text=%@&per_page=25&format=json&nojsoncallback=1&page=%ld",apiKey,strSearch,page];
    NSLog(@"Amit-test url%@",strURL);
    [NetworkAdapter sendRequestWithURL:[NSURL URLWithString:strURL] completionHandler:^(NSData *responseData, NSString *errorMsg) {
        if(self->_completionBlock){
            FlickrPages *pages = [self setFlickrPagesModel:responseData];
            self->_completionBlock(pages);
            
        }
    }];
}
-(FlickrPages*)setFlickrPagesModel:(NSData*)responseData{
    NSError *error;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseData
                                            options:NSJSONReadingMutableContainers
                                                           error:&error];
    return [[FlickrPages alloc] initWithDict:jsonDict];
}
@end
