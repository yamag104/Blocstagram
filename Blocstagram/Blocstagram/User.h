//
//  User.h
//  Blocstagram
//
//  Created by Yoko Yamaguchi on 9/4/15.
//  Copyright (c) 2015 Yoko Yamaguchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *idNumber;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSURL *profilePictureURL;
@property (nonatomic, strong) UIImage *profilePicture;

@end
