//
//  MediaFullScreenViewController.h
//  Blocstagram
//
//  Created by Yoko Yamaguchi on 9/17/15.
//  Copyright © 2015 Yoko Yamaguchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Media;

@interface MediaFullScreenViewController : UIViewController

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

- (instancetype) initwithMedia:(Media *)media;

- (void) centerScrollView;

@end
