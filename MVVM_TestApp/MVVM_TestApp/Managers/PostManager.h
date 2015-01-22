//
//  PostManager.h
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/22/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "BaseManager.h"

@interface PostManager : BaseManager

- (void)fetchPostOfUser:(NSString *)userID completion:(void(^)(NSArray * postArray, NSError *error))completion;

@end
