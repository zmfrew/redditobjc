//
//  ZMFPostController.m
//  RedditObjC
//
//  Created by Zachary Frew on 7/26/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMFPostController.h"
#import "ZMFPost.h"

@implementation ZMFPostController

// MARK: - Singleton
+ (ZMFPostController *)sharedController
{
    static ZMFPostController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [ZMFPostController new];
    });
    return sharedController;
}

// MARK: - Property Methods
- (NSURL *)baseURL
{
    return [NSURL URLWithString:@"https://www.reddit.com/r/"];
}

// MARK: - Methods
- (void)retrievePostsWithSearchTerm:(NSString *)searchTerm completion:(void (^) (NSArray<ZMFPost *> *posts))completion
{
    NSURL *searchURL = [self baseURL];
    searchURL = [searchURL URLByAppendingPathComponent:searchTerm];
    searchURL = [searchURL URLByAppendingPathExtension:@"json"];

    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error occurred retrieving posts: %@", [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"Error occurred: no data was returned");
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *dataDictionary = jsonDictionary[@"data"];
        NSArray *childrenArray = dataDictionary[@"children"];
        NSMutableArray *posts = [NSMutableArray new];
        
        for (NSDictionary *postDictionary in childrenArray) {
            ZMFPost *post = [[ZMFPost alloc] initWithDictionary:postDictionary];
            [posts addObject:post];
        }
        
        completion(posts);
    }] resume];
    
}

- (void)retrieveImageFromPost:(ZMFPost *)post completion:(void (^) (UIImage *))completion
{
    NSString *imageURLString = [[NSString alloc] initWithFormat:post.postImage];
    NSURL *imageURL = [NSURL URLWithString:imageURLString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error occurred retrieving posts: %@", [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"Error occurred: no data was returned");
            completion(nil);
            return;
        }
        
        UIImage *image = [UIImage imageWithData:data];
        completion(image);
        
    }] resume];
}

@end
