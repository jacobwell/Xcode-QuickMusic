//
//  ArtworkData.h
//  TestOne
//
//  Created by Craig Williams on 9/23/09.
//  Copyright 2009 AllanCraig. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface OC_iTunesArtwork : NSObject {
	IBOutlet NSImageView *iv;
}
-(void)updateImage;
-(void)noImage;
@end
