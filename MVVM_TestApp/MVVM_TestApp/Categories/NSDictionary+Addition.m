//
//  NSDictionary+Addition.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/22/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "NSDictionary+Addition.h"
#import "Constant.h"

@implementation NSDictionary (Addition)

+ (NSDictionary *)authenticationDictionaryWithParam:(NSDictionary *)paramDictionary
{
    __block NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    NSString *auth_token = [[NSUserDefaults standardUserDefaults] objectForKey:authTokenKey];
    [dictionary setObject:auth_token forKey:@"auth_token"];
    
    [paramDictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [dictionary setObject:obj forKey:key];
    }];
    
    return dictionary;
}

@end
