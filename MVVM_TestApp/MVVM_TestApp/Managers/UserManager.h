//
//  UserManager.h
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/19/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseManager.h"

@class DeviceInfo;
@class User;

@interface UserManager : BaseManager

- (void)loginWithUsername:(NSString *)username
                 password:(NSString *)password
               deviceInfo:(DeviceInfo *)deviceInfo
               completion:(void(^)(User *user, NSError *error))completion;

- (void)saveUser:(User *)user;
+ (User *)currentUser;

@end
