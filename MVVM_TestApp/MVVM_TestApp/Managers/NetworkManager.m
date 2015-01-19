//
//  NetworkManager.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/14/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "NetworkManager.h"
#import <AFNetworking/AFNetworking.h>


static NSString* const baseURL = @"http://dev.likeitfindit.com.au/apps/api";
static NSString* const getPostsURL = @"/index/get-post";
static NSString* const getPostDetailURL = @"/index/post-detail";

@implementation NetworkManager

+ (id)sharedManager
{
    static NetworkManager *sharedInstance = nil;
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NetworkManager alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
    });
    return sharedInstance;
}

@end
