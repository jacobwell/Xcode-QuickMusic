#import "ArtworkController.h"

@implementation ArtworkController

+(void)displayArtworkInImageView:(NSImageView *)theImageView trackHasArtwork:(BOOL)hasArtwork {
    NSImage *image;
    if (hasArtwork) {
        NSAppleScript *aScript = [[[NSAppleScript alloc] initWithSource:@"tell application \"iTunes\"\n \
								   return (data of artwork 1 of current track) as picture\n \
								   end tell"] autorelease];
        NSData *rawData = [[aScript executeAndReturnError:nil] data];
        image = [[[NSImage alloc] initWithData:rawData] autorelease];
    }
    else {
        /* Use a default image located in your app resources */
        image = [NSImage imageNamed:@"NoArtwork.png"];
		
        /* Use no image when no artwork exists */
        //image = nil;
    }
    [theImageView setImage:image];
}
@end