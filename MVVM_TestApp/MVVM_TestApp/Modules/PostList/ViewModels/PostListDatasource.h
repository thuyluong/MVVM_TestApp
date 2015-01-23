//
//  PostListDatasource.h
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/20/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class PostListViewModel;

@interface PostListDatasource : NSObject <UITableViewDataSource>

- (instancetype)initWithModel:(PostListViewModel *)viewModel;

@end
