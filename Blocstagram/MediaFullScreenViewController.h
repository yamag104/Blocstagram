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

- (instancetype) initWithMedia:(Media *)media;

/*
 This method will center the image on the appropriate axis if the image is zoomed out so it doesn't fill the full scroll view.
 i.e. equal blank space on the top and bottom when zoomed.
 */
- (void) centerScrollView;

@end
