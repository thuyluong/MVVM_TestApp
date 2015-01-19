//
//  AutheticationManager.h
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/19/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "NetworkManager.h"

@interface AutheticationManager : NetworkManager

- (instancetype)initWithNetworkManager:(NetworkManager *)networkManager;

- (void)loginWithUsername:(NSString *)username
                 password:(NSString *)password
               deviceInfo:(DeviceInfo *)deviceInfo
               completion:(void(^)(User *user, NSError *error))completion;

@end
