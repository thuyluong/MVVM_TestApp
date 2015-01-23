//
//  PostListViewModel.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/20/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "PostListViewModel.h"
#import "PostListViewController.h"
#import "PostListDatasource.h"
#import "PostListDelegate.h"
#import "PostManager.h"
#import "UserManager.h"
#import "Post.h"
#import "User.h"
#import <Mantle.h>

@interface PostListViewModel()

@property (nonatomic, weak) PostListViewController *postListViewController;
@property (nonatomic, strong) PostListDatasource *dataSource;
@property (nonatomic, strong) PostListDelegate *delegate;
@property (nonatomic, strong) NSMutableArray *postList;

@end

@implementation PostListViewModel

#pragma mark - Alloc
- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    if (self) {
        _tableView = tableView;
        [self registerDataSourceAndDelegate];
    }
    return self;
}

#pragma mark -
- (void)loadPostList
{
    User *currentUser = [UserManager currentUser];
    [[PostManager sharedManager] fetchPostOfUser:currentUser.userID completion:^(NSArray *postArray, NSError *error) {
        self.postList = [postArray mutableCopy];
    }];
}

- (void)registerDataSourceAndDelegate
{
    self.dataSource = [[PostListDatasource alloc] initWithModel:self];
    self.delegate = [[PostListDelegate alloc] initWithModel:self];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.delegate;
}

#pragma mark - DataSource
- (NSInteger)numberOfSections
{
    return 1;
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section
{
    return self.postList.count;
}

- (Post *)postItemForIndexPath:(NSIndexPath *)indexPath
{
    return self.postList[indexPath.row];
}

@end
