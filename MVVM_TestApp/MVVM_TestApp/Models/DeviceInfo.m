//
//  DeviceInfo.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/14/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "DeviceInfo.h"

@implementation DeviceInfo

+ (DeviceInfo *)getDeviceInfo
{
    DeviceInfo *deviceInfo = [[DeviceInfo alloc] init];
    deviceInfo.deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"deviceToken"];
    deviceInfo.deviceName = @"MyIphone";
    deviceInfo.deviceModel = @"Iphone";
    deviceInfo.deviceOSName = @"iOS";
    deviceInfo.deviceOSVersion = @"8";
    
    return deviceInfo;
}

- (void)updateToUserDefault
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:self];
    [[NSUserDefaults standardUserDefaults] setObject:encodedObject forKey:@"device_info"];
}

+ (DeviceInfo *)updateFromUserDefault
{
    NSData *decodedObject = [[NSUserDefaults standardUserDefaults] objectForKey:@"device_info"];
    DeviceInfo *deviceInfo;
    if (!decodedObject) {
        deviceInfo = [self getDeviceInfo];
        [deviceInfo updateToUserDefault];
    }
    else {
        deviceInfo = [NSKeyedUnarchiver unarchiveObjectWithData:decodedObject];
    }
    
    return deviceInfo;
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.deviceToken forKey:@"device_token"];
    [aCoder encodeObject:self.deviceName forKey:@"device_name"];
    [aCoder encodeObject:self.deviceModel forKey:@"device_model"];
    [aCoder encodeObject:self.deviceOSName forKey:@"device_os_name"];
    [aCoder encodeObject:self.deviceOSVersion forKey:@"device_os_version"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _deviceToken = [aDecoder decodeObjectForKey:@"device_token"];
        _deviceName = [aDecoder decodeObjectForKey:@"device_name"];
        _deviceModel = [aDecoder decodeObjectForKey:@"device_model"];
        _deviceOSName = [aDecoder decodeObjectForKey:@"device_os_name"];
        _deviceOSVersion = [aDecoder decodeObjectForKey:@"device_os_version"];
    }
    return self;
}

@end
