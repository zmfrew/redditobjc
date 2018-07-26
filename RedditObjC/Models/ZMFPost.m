//
//  ZMFPost.m
//  RedditObjC
//
//  Created by Zachary Frew on 7/26/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

#import "ZMFPost.h"

@implementation ZMFPost

// MARK: - Initializers
- (instancetype)initWithTitle:(NSString *)title ups:(NSInteger)ups commentCount:(NSInteger)commentCount postImage:(NSString *)postImage
{
    self = [super init];
    if (self) {
        _title = [title copy];
        _ups = ups;
        _commentCount = commentCount;
        _postImage = [postImage copy];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSDictionary *dataDictionary = dictionary[@"data"];
    
    NSString *title = dataDictionary[[ZMFPost titlekey]];
    NSInteger ups = [dataDictionary[[ZMFPost upsKey]] integerValue];
    NSInteger commentCount = [dataDictionary[[ZMFPost commentCountKey]] integerValue];
    NSString *postImage = dataDictionary[[ZMFPost postImageKey]];
    
    return [self initWithTitle:title ups:ups commentCount:commentCount postImage:postImage];
}

// MARK: - Dictionary Key Methods
+ (NSString *)titlekey
{
    return @"title";
}

+ (NSString *)upsKey
{
    return @"ups";
}

+ (NSString *)commentCountKey
{
    return @"num_comments";
}

+ (NSString *)postImageKey
{
    return @"thumbnail";
}

@end
