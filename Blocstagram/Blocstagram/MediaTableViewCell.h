//
//  MediaTableViewCell.h
//  Blocstagram
//
//  Created by Yoko Yamaguchi on 9/4/15.
//  Copyright (c) 2015 Yoko Yamaguchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Media;

@interface MediaTableViewCell : UITableViewCell

@property (nonatomic, strong) Media *mediaItem;

// Get the media item
- (Media *)mediaItem;

// Set a new media item
- (void)setMediaItem:(Media *)mediaItem;

+ (CGFloat) heightForMediaItem:(Media *)mediaItem width:(CGFloat)width;

@end
