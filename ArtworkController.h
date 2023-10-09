#import <Cocoa/Cocoa.h>
#import <AppKit/AppKit.h>

@interface ArtworkController : NSObject {}
+(void)displayArtworkInImageView:(NSImageView *)theImageView trackHasArtwork:(BOOL)hasArtwork;
@end