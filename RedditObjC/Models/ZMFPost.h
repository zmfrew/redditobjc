//
//  ZMFPost.h
//  RedditObjC
//
//  Created by Zachary Frew on 7/26/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMFPost : NSObject

NS_ASSUME_NONNULL_BEGIN

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSInteger ups;
@property (nonatomic, readonly) NSInteger commentCount;
@property (nonatomic, copy, readonly) NSString *imageURLExtension;

- (instancetype)initWithTitle:(NSString *)title
                           ups:(NSInteger)ups
                  commentCount:(NSInteger)commentCount
             imageURLExtension:(NSString *)imageURLExtension;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


NS_ASSUME_NONNULL_END

@end
