//
//  NetworkManager.h
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/14/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@class DeviceInfo;
@class User;

@interface NetworkProvider : AFHTTPRequestOperationManager

+ (instancetype)sharedInstance;

@end
