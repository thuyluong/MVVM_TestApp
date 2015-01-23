//
//  Post.m
//  MVVM_TestApp
//
//  Created by ThuyLuong on 1/14/15.
//  Copyright (c) 2015 ThuyLuong. All rights reserved.
//

#import "Post.h"

@implementation Post


//@property (nonatomic, strong) NSString *postID;
//@property (nonatomic, strong) NSString *title;
//@property (nonatomic, strong) NSString *authorName;
//@property (nonatomic, strong) NSString *authorUserID;
//@property (nonatomic, strong) NSString *categoryID;
//@property (nonatomic, assign) NSInteger countFollow;
//@property (nonatomic, assign) NSInteger countAnswer;
//@property (nonatomic, strong) NSDate *createdDate;
//@property (nonatomic, strong) NSString *imageURL;
//@property (nonatomic, assign) BOOL canEdit;
//@property (nonatomic, assign) BOOL isFollowAuthor;
//@property (nonatomic, assign) BOOL isFollowPost;
//@property (nonatomic, assign) BOOL isFound;

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    return dateFormatter;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"postID" : @"post_id",
             @"title" : @"title",
             @"authorName" : @"author_name",
             @"authorUserID" : @"author_user_id",
             @"categoryID" : @"category_id",
             @"countFollow" : @"count_follow",
             @"countAnswer" : @"count_answer",
             @"createdDate" : @"created_date",
             @"imageURL" : @"image",
             @"canEdit" : @"can_edit",
             @"isFollowAuthor" : @"is_follow_author",
             @"isFollowPost" : @"is_follow_post",
             @"isFound" : @"is_found"};
}

+ (NSValueTransformer *)createdDateJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *string) {
        return [[self dateFormatter] dateFromString:string];
    } reverseBlock:^id(NSDate *date) {
        return [[self dateFormatter] stringFromDate:date];
    }];
}

/*
+ (NSValueTransformer *)canEditJSONTransformer
{
    return [MTLValueTransformer mtl_valueMappingTransformerWithDictionary:@{@"1" : @(YES),
                                                                            @"0" : @(NO)}];
}

+ (NSValueTransformer *)isFollowAuthorJSONTransformer
{
    return [MTLValueTransformer mtl_valueMappingTransformerWithDictionary:@{@"1" : @(YES),
                                                                            @"0" : @(NO)}];
}

+ (NSValueTransformer *)isFollowAPostJSONTransformer
{
    return [MTLValueTransformer mtl_valueMappingTransformerWithDictionary:@{@"1" : @(YES),
                                                                            @"0" : @(NO)}];
}

+ (NSValueTransformer *)isFoundJSONTransformer
{
    return [MTLValueTransformer mtl_valueMappingTransformerWithDictionary:@{@"1" : @(YES),
                                                                            @"0" : @(NO)}];
}
 */

@end
