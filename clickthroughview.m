//
//  clickthroughview.m
//  QuickMusic
//
//  Created by Jake Wells on 2/16/11.
//  Copyright 2011 GlxyWell. All rights reserved.
//

#import "clickthroughview.h"


@implementation clickthroughview

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    // Drawing code here.
}

- (BOOL)shouldDelayWindowOrderingForEvent:(NSEvent *)theEvent; 
{
	return YES;
}

- (BOOL)acceptsFirstMouse:(NSEvent *)theEvent; 
{
	return YES; 
}

- (void)mouseDown:(NSEvent *)theEvent; 
{
	[NSApp preventWindowOrdering]; 
}


@end
