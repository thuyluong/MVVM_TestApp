//
//  BaseManager.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/20/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "BaseManager.h"

@implementation BaseManager

- (instancetype)initWithNetworkProvider:(NetworkProvider *)provider
{
    self = [super init];
    if (self) {
        _provider = provider;
    }
    return self;
}

+ (instancetype)sharedManager
{
    static id sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithNetworkProvider:[NetworkProvider sharedInstance]];
    });
    return sharedInstance;
}


@end
