//
//  PostManager.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/22/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "PostManager.h"
#import "NetworkProvider.h"
#import "NSDictionary+Addition.h"

static NSString* const getPostsURL = @"index/get-post";
static NSString* const getPostDetailURL = @"index/post-detail";

@implementation PostManager

- (instancetype) initWithNetworkProvider:(NetworkProvider *)provider
{
    self = [super init];
    if (self) {
        self.provider = provider;
    }
    return self;
}

+ (instancetype)sharedManager
{
    static PostManager *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PostManager alloc] initWithNetworkProvider:[NetworkProvider sharedInstance]];
    });
    return sharedInstance;
}

- (void)fetchPostOfUser:(NSString *)userID completion:(void (^)(NSArray *, NSError *))completion
{
    NSDictionary *params = [NSDictionary authenticationDictionaryWithParam:@{@"user_id" : userID}];
    [self.provider POST:getPostsURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self handlePostResponse:responseObject completionBlock:completion];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completion(nil, error);
    }];
}

- (void)handlePostResponse:(id)responseObject completionBlock:(void (^)(NSArray *, NSError *))completion
{
    NSInteger errorCode = [responseObject[@"error"] integerValue];
    if (errorCode == 0) {
        NSArray *postList = responseObject[@"result"][@"items"];
        NSArray *postModelList = [[self class] postModelsFromPostArray:postList];
        completion(postModelList, nil);
    }
    else {
        NSError *error = [NSError errorWithDomain:@"LIFIF" code:errorCode userInfo:@{@"errorMessage" : responseObject[@"errMsg"]}];
        completion(nil, error);
    }
}

@end
