#import <Foundation/Foundation.h>

@interface DataSource : NSObject
+(instancetype) sharedInstance;
// readonly prevents other class from modifying it
@property (nonatomic, strong, readonly) NSArray *mediaItems;

@end
