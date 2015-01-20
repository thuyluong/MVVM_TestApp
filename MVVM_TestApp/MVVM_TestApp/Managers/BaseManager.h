//
//  BaseManager.h
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/20/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkProvider.h"

@interface BaseManager : NSObject

@property (nonatomic, weak) NetworkProvider* provider;

+ (instancetype)sharedManager;

@end
