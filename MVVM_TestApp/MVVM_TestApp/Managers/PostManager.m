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

- (void)fetchPostOfUser:(NSString *)userID completion:(void (^)(NSArray *, NSError *))completion
{
    NSDictionary *params = [NSDictionary authenticationDictionaryWithParam:@{@"user_id" : userID}];
    [self.provider POST:getPostsURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSInteger errorCode = [responseObject[@"error"] integerValue];
        if (errorCode == 0) {
            completion(responseObject[@"result"][@"items"], nil);
        }
        else {
            NSError *error = [NSError errorWithDomain:@"LIFIF" code:errorCode userInfo:@{@"errorMessage" : responseObject[@"errMsg"]}];
            completion(nil, error);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completion(nil, error);
    }];
}


@end
