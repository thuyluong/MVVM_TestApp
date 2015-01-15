//
//  LoginViewModel.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/14/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "LoginViewModel.h"
#import "NSString+Addition.h"

@implementation LoginViewModel

- (BOOL)userNameIsEmailFormat
{
    return [self.userName isEmailFormat];
}

@end
