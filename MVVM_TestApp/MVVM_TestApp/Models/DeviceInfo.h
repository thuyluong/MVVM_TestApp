//
//  DeviceInfo.h
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/14/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceInfo : NSObject <NSCoding>

@property (nonatomic, strong) NSString *deviceToken;
@property (nonatomic, strong) NSString *deviceName;
@property (nonatomic, strong) NSString *deviceOSName;
@property (nonatomic, strong) NSString *deviceOSVersion;
@property (nonatomic, strong) NSString *deviceModel;

- (void)updateToUserDefault;
+ (DeviceInfo *)updateFromUserDefault;

@end
