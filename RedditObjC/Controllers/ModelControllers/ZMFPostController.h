//
//  ZMFPostController.h
//  RedditObjC
//
//  Created by Zachary Frew on 7/26/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class ZMFPost;

@interface ZMFPostController : NSObject

NS_ASSUME_NONNULL_BEGIN

+ (instancetype)sharedController;

- (void)retrievePostsWithSearchTerm:(NSString *)searchTerm completion:(void (^) (NSArray<ZMFPost *> *posts))completion;

- (void)retrieveImageFromPost:(ZMFPost *)post completion:(void (^) (UIImage *))completion;

NS_ASSUME_NONNULL_END

@end
