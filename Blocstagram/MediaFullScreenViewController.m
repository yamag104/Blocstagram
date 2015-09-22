//
//  MediaFullScreenViewController.m
//  Blocstagram
//
//  Created by Yoko Yamaguchi on 9/17/15.
//  Copyright © 2015 Yoko Yamaguchi. All rights reserved.
//

#import "MediaFullScreenViewController.h"
#import "Media.h"
#import "DataSource.h"

@interface MediaFullScreenViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) Media *media;
@property (nonatomic, strong) UITapGestureRecognizer *tap;
@property (nonatomic, strong) UITapGestureRecognizer *doubleTap;
@property (nonatomic, strong) UIButton *shareButton;
@end

@implementation MediaFullScreenViewController

- (instancetype) initWithMedia:(Media *)media {
    self = [super init];
    
    if (self) {
        self.media = media;
    }
    
    return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    // Configure a scroll view
    self.scrollView = [UIScrollView new];
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.scrollView];
    
    // Configure an Image view
    self.imageView = [UIImageView new];
    self.imageView.image = self.media.image;
    
    [self.scrollView addSubview:self.imageView];
    
    // contentSize: size of the content view
    self.scrollView.contentSize = self.media.image.size;
    
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFired:)];
    
    self.doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapFired:)];
    self.doubleTap.numberOfTapsRequired = 2;
    
    /* Allows one gesture recognizer to wait for another gesture recognizer to fail before it succeeds. Without this line, it would be impossible to double-tap because single tap gesture recognizer would fire before the user had a change to tap twice. */
    [self.tap requireGestureRecognizerToFail:self.doubleTap];
    
    [self.scrollView addGestureRecognizer:self.tap];
    [self.scrollView addGestureRecognizer:self.doubleTap];
    
    /* Share Button */
    self.shareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.shareButton setTitle:@"Share" forState:UIControlStateNormal];
    [self.view addSubview:self.shareButton];
    [self.shareButton addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
}

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // Make the scroll view always take up all of the view's space
    self.scrollView.frame = self.view.bounds;
    
    // Ratio of the scroll view's width&&height to the image's width&&height
    CGSize scrollViewFrameSize = self.scrollView.frame.size;
    CGSize scrollViewContentSize = self.scrollView.contentSize;
    
    CGFloat scaleWidth = scrollViewFrameSize.width / scrollViewContentSize.width;
    CGFloat scaleHeight = scrollViewFrameSize.height / scrollViewContentSize.height;
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    
    // smaller one will become our |minimumzoomScale|
    // prevents user from pinching the image so small that there's wasted screen space
    self.scrollView.minimumZoomScale = minScale;
    // 100%
    self.scrollView.maximumZoomScale = 1;
    
    [self.shareButton.titleLabel sizeToFit];
    CGSize shareButtonSize = self.shareButton.titleLabel.frame.size;
    self.shareButton.frame = CGRectMake(CGRectGetWidth(self.view.bounds) - shareButtonSize.width-40, 40, shareButtonSize.width+20, shareButtonSize.height+10);
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self centerScrollView];
}

- (void) centerScrollView {
    [self.imageView sizeToFit];
    
    CGSize boundsSize = self.scrollView.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - CGRectGetWidth(contentsFrame)) / 2;
    } else {
        contentsFrame.origin.x = 0;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - CGRectGetHeight(contentsFrame)) / 2;
    } else {
        contentsFrame.origin.y = 0;
    }
    
    self.imageView.frame = contentsFrame;
}

#pragma mark - UIScrollViewDelegate

// Tells the scroll view which view to zoom in
- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    [self centerScrollView];
}

#pragma mark - Gesture Recognizers

// Single Tap: dissmiss the view controller
- (void) tapFired:(UITapGestureRecognizer *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// Double Taps: adjust the zoom level
- (void) doubleTapFired:(UITapGestureRecognizer *)sender {
    if (self.scrollView.zoomScale == self.scrollView.minimumZoomScale) {
        /* If the current zoom scale is already as small as it can be, double tapping will zoom in */
        CGPoint locationPoint = [sender locationInView:self.imageView];
        CGSize scrollViewSize = self.scrollView.bounds.size;
        
        CGFloat width = scrollViewSize.width / self.scrollView.maximumZoomScale;
        CGFloat height = scrollViewSize.height / self.scrollView.maximumZoomScale;
        CGFloat x = locationPoint.x - (width / 2);
        CGFloat y = locationPoint.y - (height / 2);
        
        [self.scrollView zoomToRect:CGRectMake(x, y, width, height) animated:YES];
    } else {
        /* If the current zoom scale is larger, then zoom out to the minimum scale */
        [self.scrollView setZoomScale:self.scrollView.minimumZoomScale animated:YES];
    }
}

- (void) share{
    [[DataSource sharedInstance] share:self.media withViewController:self];
}


@end
