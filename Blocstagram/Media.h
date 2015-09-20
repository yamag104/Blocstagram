//
//  Media.h
//  Blocstagram
//
//  Created by Yoko Yamaguchi on 9/4/15.
//  Copyright (c) 2015 Yoko Yamaguchi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MediaDownloadState) {
    MediaDownloadStateNeedsImage = 0,
    MediaDownloadStateDownloadInProgress = 1,
    MediaDownloadStateNonRecoverableError = 2,
    MediaDownloadStateHasImage = 3
};

// Avoids Circular inclusion instead of doing #import "User.h"
@class User;

@interface Media : NSObject<NSCoding>

@property (nonatomic, strong) NSString *idNumber;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSURL *mediaURL;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) MediaDownloadState downloadState;
@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) NSArray *comments;
- (instancetype) initWithDictionary:(NSDictionary *)mediaDictionary;
@end
