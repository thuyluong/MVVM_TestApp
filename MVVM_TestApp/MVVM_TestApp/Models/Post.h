//
//  Post.h
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/14/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>

@interface Post : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *authorName;
@property (nonatomic, strong) NSString *authorUserID;
@property (nonatomic, strong) NSString *categoryID;
@property (nonatomic, assign) NSInteger countFollow;
@property (nonatomic, assign) NSInteger countAnswer;
@property (nonatomic, strong) NSDate *createdDate;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, assign) BOOL canEdit;
@property (nonatomic, assign) BOOL isFollowAuthor;
@property (nonatomic, assign) BOOL isFollowPost;
@property (nonatomic, assign) BOOL isFound;
// hit

@end
