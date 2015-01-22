//
//  PostListDelegate.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/20/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "PostListDelegate.h"
#import "PostListViewModel.h"

@implementation PostListDelegate

- (instancetype)initWithPostListViewModel:(PostListViewModel *)postListViewModel
{
    self = [super init];
    if (self) {
        _postListViewModel = postListViewModel;
    }
    return self;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
