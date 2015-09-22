#import <Foundation/Foundation.h>
#import <UICKeyChainStore.h>

@class Media;
@class UIViewController;
typedef void (^NewItemCompletionBlock)(NSError *error);

@interface DataSource : NSObject
+(instancetype) sharedInstance;
+(NSString *) instagramClientID;
// readonly prevents other class from modifying it
@property (nonatomic, strong, readonly) NSArray *mediaItems;
@property (nonatomic, strong, readonly) NSString *accessToken;

- (void) deleteMediaItem:(Media *)item;
- (void) moveMediaItemToTop:(Media *)item;
- (void) requestNewItemsWithCompletionHandler:(NewItemCompletionBlock)completionHandler;
- (void) requestOldItemsWithCompletionHandler:(NewItemCompletionBlock)completionHandler;

- (void) share:(Media*) media withViewController:(UIViewController *) vc;
@end
