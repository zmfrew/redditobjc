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
- (instancetype)initWithTitle:(NSString *)title ups:(NSInteger)ups commentCount:(NSInteger)commentCount imageURLExtension:(NSString *)imageURLExtension
{
    self = [super init];
    if (self) {
        _title = [title copy];
        _ups = ups;
        _commentCount = commentCount;
        _imageURLExtension = [imageURLExtension copy];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[[ZMFPost titlekey]];
    NSInteger ups = [dictionary[[ZMFPost upsKey]] integerValue];
    NSInteger commentCount = [dictionary[[ZMFPost commentCountKey]] integerValue];
    NSString *imageURLExtension = dictionary[[ZMFPost imageURLExtensionKey]];
    
    return [self initWithTitle:title ups:ups commentCount:commentCount imageURLExtension:imageURLExtension];
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

+ (NSString *)imageURLExtensionKey
{
    return @"thumbnail";
}

@end
