//
//  User.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/17/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "User.h"

@implementation User

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"userID" : @"user_id",
             @"groupID" : @"group_id",
             @"username" : @"username",
             @"displayName" : @"display_name",
             @"fullName" : @"full_name" };
}

@end
