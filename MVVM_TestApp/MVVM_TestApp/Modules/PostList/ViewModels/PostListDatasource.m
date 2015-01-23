//
//  PostListDatasource.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/20/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "PostListDatasource.h"
#import "PostListViewModel.h"
#import "Post.h"

@interface PostListDatasource()

@property (nonatomic, weak) PostListViewModel *postListViewModel;

@end

@implementation PostListDatasource

- (instancetype)initWithModel:(PostListViewModel *)viewModel
{
    self = [super init];
    if (self) {
        _postListViewModel = viewModel;
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.postListViewModel numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.postListViewModel numberOfItemsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostListCell" forIndexPath:indexPath];
    Post *postItem = [self.postListViewModel postItemForIndexPath:indexPath];
    cell.textLabel.text = postItem.title;
    return cell;
}

@end
