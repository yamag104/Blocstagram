#import <Foundation/Foundation.h>

@class Media;
@interface DataSource : NSObject
+(instancetype) sharedInstance;
// readonly prevents other class from modifying it
@property (nonatomic, strong, readonly) NSArray *mediaItems;
- (void) deleteMediaItem:(Media *)item;
- (void) moveMediaItemToTop:(Media *)item;
@end
