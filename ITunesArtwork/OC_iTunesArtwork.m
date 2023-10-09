//
//  ArtworkData.m
//  TestOne
//
//  Created by Craig Williams on 9/23/09.
//  Copyright 2009 AllanCraig. All rights reserved.
//

#import "OC_iTunesArtwork.h"


@implementation OC_iTunesArtwork

-(void)updateImage
{
	NSPasteboard *pboard = [NSPasteboard generalPasteboard];
	NSData *pictData = [pboard dataForType:NSTIFFPboardType];
	NSImage *img = [[NSImage alloc] initWithData:pictData];
	[iv setImage:img];
	[img release];
}

-(void)noImage
{
	[iv setImage:[NSImage imageNamed:@"red"]];
}
@end
