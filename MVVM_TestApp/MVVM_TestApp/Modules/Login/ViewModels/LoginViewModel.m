//
//  LoginViewModel.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/14/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "LoginViewModel.h"
#import "NSString+Addition.h"
#import "LoginViewController.h"
#import "User.h"
#import "UserManager.h"
#import "DeviceInfo.h"

@interface LoginViewModel()

@property (nonatomic, weak) LoginViewController *loginViewController;

@end

@implementation LoginViewModel

- (instancetype)initWithLoginViewController:(LoginViewController *)loginViewController
{
    self = [super init];
    if (self) {
        _loginViewController = loginViewController;
    }
    return self;
}
 
- (BOOL)isValidUserName
{
    return [self.username isEmailFormat];
}

- (void)startLogin
{
    DeviceInfo *deviceInfo = [DeviceInfo updateFromUserDefault];
    [[UserManager sharedManager] loginWithUsername:self.username
                                          password:self.password
                                        deviceInfo:deviceInfo completion:^(User *user, NSError *error) {
        if (user && !error) {
            [self.loginViewController finishLogin];
        }
    }];
}

@end
