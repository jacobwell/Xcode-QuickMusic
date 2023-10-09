//
//  CHRPopUpButton.m
//  QuickMusic
//
//  Created by Jake Wells on 2/15/11.
//  Copyright 2011 GlxyWell. All rights reserved.
//

#import "CHRPopUpButton.h"


#import "CHRPopUpButton.h"

@implementation CHRPopUpButton
- (void)awakeFromNib {
	NSPopUpButton* popupButton = self;
	[[popupButton cell] setArrowPosition:NSPopUpNoArrow];
}
@end
