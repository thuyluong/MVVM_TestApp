//
//  User.h
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/17/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "MTLModel.h"

@interface User : MTLModel

@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *groupID;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *fullName;

@end
