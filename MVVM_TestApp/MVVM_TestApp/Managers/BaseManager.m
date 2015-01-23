//
//  BaseManager.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/20/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "BaseManager.h"
#import <Mantle.h>
#import "Post.h"

@implementation BaseManager

- (instancetype)initWithNetworkProvider:(NetworkProvider *)provider
{
    self = [super init];
    if (self) {
        _provider = provider;
    }
    return self;
}

+ (NSArray *)postModelsFromPostArray:(NSArray *)postArray
{
    return [MTLJSONAdapter modelsOfClass:[Post class] fromJSONArray:postArray error:nil];
}

@end
