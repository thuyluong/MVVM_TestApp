//
//  LoginViewModel.h
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/14/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginViewModel : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

- (BOOL)userNameIsEmailFormat;

@end
