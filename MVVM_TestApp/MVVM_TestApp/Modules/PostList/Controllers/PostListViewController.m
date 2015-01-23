//
//  PostListViewController.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/20/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "PostListViewController.h"
#import <KVOController/FBKVOController.h>
#import "PostListViewModel.h"

@interface PostListViewController ()

@property (nonatomic, strong) PostListViewModel *postListViewModel;
@property (nonatomic, weak) IBOutlet UITableView *postsTableView;

@end

@implementation PostListViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.postListViewModel = [[PostListViewModel alloc] initWithTableView:self.postsTableView];
    [self observerPostList];
    [self.postListViewModel loadPostList];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Posts list observer
- (void)observerPostList
{
    FBKVOController *kvoController = [[FBKVOController alloc] initWithObserver:self];
    self.KVOController = kvoController;
    [self.KVOController observe:self.postListViewModel keyPath:@"postList" options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
        [self.postsTableView reloadData];
    }];
}

@end
