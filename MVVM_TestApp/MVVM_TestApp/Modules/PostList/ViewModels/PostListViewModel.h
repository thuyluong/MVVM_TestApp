//
//  PostListViewModel.h
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/20/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class PostListViewController;
@class Post;

@interface PostListViewModel : NSObject

@property (nonatomic, weak) UITableView *tableView;

- (instancetype)initWithTableView:(UITableView *)tableView;
- (void)loadPostList;

- (Post *)postItemForIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)numberOfSections;
- (NSInteger)numberOfItemsInSection:(NSInteger)section;


@end
