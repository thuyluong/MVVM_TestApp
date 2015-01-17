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

@interface NetworkManager : AFHTTPRequestOperationManager

+ (id)sharedManager;
- (void)loginWithUsername:(NSString *)username
                 password:(NSString *)password
               deviceInfo:(DeviceInfo *)deviceInfo
                  success:(void(^)(BOOL result))success
                  failure:(void(^)(NSError *error))failure;

@end
