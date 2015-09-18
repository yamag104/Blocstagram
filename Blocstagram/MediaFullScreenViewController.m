//
//  MediaFullScreenViewController.m
//  Blocstagram
//
//  Created by Yoko Yamaguchi on 9/17/15.
//  Copyright © 2015 Yoko Yamaguchi. All rights reserved.
//

#import "MediaFullScreenViewController.h"
#import "Media.h"

@interface MediaFullScreenViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) Media *media;

@end

@implementation MediaFullScreenViewController

- (instancetype) initwithMedia:(Media *)media {
    self = [super init];
    
    if (self) {
        self.media = media;
    }
    
    return self;
}

@end
