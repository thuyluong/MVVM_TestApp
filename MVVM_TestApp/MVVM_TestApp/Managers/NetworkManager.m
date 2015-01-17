//
//  NetworkManager.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/14/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "NetworkManager.h"
#import "DeviceInfo.h"
#import <AFNetworking/AFNetworking.h>

#import "Constant.h"

static NSString* const baseURL = @"http://dev.likeitfindit.com.au/";
static NSString* const loginURL = @"/api_documents/api_test.php?form=user_login";

@implementation NetworkManager

+ (id)sharedManager
{
    static NetworkManager *sharedInstance = nil;
    dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[NetworkManager alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
    });
    return sharedInstance;
}

- (void)loginWithUsername:(NSString *)username
                 password:(NSString *)password
               deviceInfo:(DeviceInfo *)deviceInfo
                  success:(void (^)(BOOL))success
                  failure:(void (^)(NSError *))failure
{
    NSDictionary *params = @{@"username" : username,
                             @"password" : password,
                             @"device_token" : deviceInfo.deviceToken,
                             @"device_name" : deviceInfo.deviceName,
                             @"device_os_name" : deviceInfo.deviceOSName,
                             @"device_os_version" : deviceInfo.deviceOSVersion,
                             @"device_model" : deviceInfo.deviceModel};
    
    [self POST:loginURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *responseDictionary = (NSDictionary *)responseObject;
        NSInteger errorCode = [responseDictionary[@"error"] integerValue];
        if (errorCode == 0) {
            NSString *authToken = responseDictionary[@"result"][@"auth_token"];
            [[NSUserDefaults standardUserDefaults] setObject:authToken forKey:authTokenKey];
            if (success) {
                success(YES);
            }
        }
        else {
            success(NO);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

@end
