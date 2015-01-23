//
//  PostListDelegate.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/20/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "PostListDelegate.h"
#import "PostListViewModel.h"

@interface PostListDelegate()

@property (nonatomic, weak) PostListViewModel *postListViewModel;

@end

@implementation PostListDelegate

- (instancetype)initWithModel:(PostListViewModel *)viewModel
{
    self = [super init];
    if (self) {
        _postListViewModel = viewModel;
    }
    return self;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
