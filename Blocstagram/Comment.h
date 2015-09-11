//
//  Comment.h
//  Blocstagram
//
//  Created by Yoko Yamaguchi on 9/4/15.
//  Copyright (c) 2015 Yoko Yamaguchi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;
@interface Comment : NSObject

@property (nonatomic, strong) NSString *idNumber;
@property (nonatomic, strong) User *from;
@property (nonatomic, strong) NSString *text;
- (instancetype) initWithDictionary:(NSDictionary *)commentDictionary;
@end
