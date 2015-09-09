#import <Foundation/Foundation.h>

@class Media;
typedef void (^NewItemCompletionBlock)(NSError *error);
@interface DataSource : NSObject
+(instancetype) sharedInstance;
// readonly prevents other class from modifying it
@property (nonatomic, strong, readonly) NSArray *mediaItems;
- (void) deleteMediaItem:(Media *)item;
- (void) moveMediaItemToTop:(Media *)item;
- (void) requestNewItemsWithCompletionHandler:(NewItemCompletionBlock)completionHandler;
- (void) requestOldItemsWithCompletionHandler:(NewItemCompletionBlock)completionHandler;
@end
