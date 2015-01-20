//
//  AutheticationManager.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/19/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "AutheticationManager.h"
#import "DeviceInfo.h"
#import "User.h"
#import "Constant.h"

static NSString* const loginURL = @"/user/login";

@interface AutheticationManager()

@property (nonatomic, strong) NetworkManager *netwokManager;

@end

@implementation AutheticationManager

- (instancetype)initWithNetworkManager:(NetworkManager *)networkManager
{
    self = [super init];
    if (self) {
        _netwokManager = networkManager;
    }
    return self;
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
    
    [self POST:loginURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self handleLoginSuccess:responseObject completion:completion];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

#pragma mark - Private
- (void)handleLoginSuccess:(id)responseObject completion:(void (^)(User *, NSError *))completion
{
    NSDictionary *responseDictionary = (NSDictionary *)responseObject;
    NSInteger errorCode = [responseDictionary[@"error"] integerValue];
    if (errorCode == 0) {
        NSString *authToken = responseDictionary[@"result"][@"auth_token"];
        [[NSUserDefaults standardUserDefaults] setObject:authToken forKey:authTokenKey];
        
        User *loggedInUser = [MTLJSONAdapter modelOfClass:[User class] fromJSONDictionary:responseObject[@"result"] error:nil];
        completion(loggedInUser, nil);
    }
    else {
        NSInteger errorCode = [responseObject[@"error"] integerValue];
        NSError *error = [NSError errorWithDomain:@"LIFI"
                                             code:errorCode
                                         userInfo:@{@"message" : responseObject[@"errorMsg"]}];
        completion(nil, error);
    }
}


@end
