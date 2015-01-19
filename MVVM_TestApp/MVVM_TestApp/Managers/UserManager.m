//
//  UserManager.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/19/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "UserManager.h"
#import "DeviceInfo.h"
#import "User.h"
#import "Constant.h"
#import "NetworkManager.h"
#import <Mantle.h>

static NSString* const loginURL = @"/user/login";

@implementation UserManager

+ (id)sharedManager
{
    static UserManager *sharedInstance = nil;
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[UserManager alloc] init];
    });
    return sharedInstance;
}

- (void)loginWithUsername:(NSString *)username
                 password:(NSString *)password
               deviceInfo:(DeviceInfo *)deviceInfo
               completion:(void (^)(User *, NSError *))completion
{
    NSDictionary *params = @{@"username" : username,
                             @"password" : password,
                             @"device_token" : deviceInfo.deviceToken,
                             @"device_name" : deviceInfo.deviceName,
                             @"device_os_name" : deviceInfo.deviceOSName,
                             @"device_os_version" : deviceInfo.deviceOSVersion,
                             @"device_model" : deviceInfo.deviceModel};
    
    [[NetworkManager sharedManager] POST:loginURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self handleLoginSuccessWithData:responseObject completion:completion];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

- (void)handleLoginSuccessWithData:(id)responseObject completion:(void (^)(User *, NSError *))completion
{
    NSDictionary *responseDictionary = (NSDictionary *)responseObject;
    NSInteger errorCode = [responseDictionary[@"error"] integerValue];
    if (errorCode == 0) {
        NSString *authToken = responseDictionary[@"result"][@"auth_token"];
        [[NSUserDefaults standardUserDefaults] setObject:authToken forKey:authTokenKey];
        User *loggedInUser = [MTLJSONAdapter modelOfClass:[User class] fromJSONDictionary:responseDictionary[@"result"] error:nil];
        completion(loggedInUser, nil);
    }
    else {
        NSString *errorMessage = responseDictionary[@"errorMsg"];
        NSError *error = [NSError errorWithDomain:@"LIFI" code:errorCode userInfo:@{@"errorMessage" : errorMessage}];
        completion(nil, error);
    }
}

@end
