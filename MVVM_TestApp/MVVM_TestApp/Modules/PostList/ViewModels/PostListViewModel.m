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
#import "Post.h"
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
    }
    return self;
}

#pragma mark -
- (void)loadPostList
{
    if (!self.postList) {
        self.postList = [NSMutableArray array];
    }
    // request get post
    [[PostManager sharedManager] fetchPostOfUser:@"1000" completion:^(NSArray *postArray, NSError *error) {
        for (NSDictionary *postDict in postArray) {
            Post *post = [MTLJSONAdapter modelOfClass:[Post class] fromJSONDictionary:postDict error:nil];
            [self.postList addObject:post];
        }
        [self.tableView reloadData];
    }];
}

- (void)registerDataSourceAndDelegate
{
    self.dataSource = [[PostListDatasource alloc] initWithTableView:self.tableView];
    self.delegate = [[PostListDelegate alloc] initWithTableView:self.tableView];
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
