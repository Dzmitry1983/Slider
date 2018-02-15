//
//  GallerySliderSuperclass.m
//  StripSlider
//
//  Created by Dmitriy on 3/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GallerySliderSuperclass.h"
#import "MyGallery.h"


@implementation GallerySliderSuperclass

@synthesize buttonPreview1;
@synthesize buttonPreview2;
@synthesize buttonPreview3;
@synthesize buttonStripped1;
@synthesize buttonStripped2;
@synthesize buttonStripped3;
@synthesize myGallery;

- (void)dealloc
{
	[buttonPreview1 release];
	[buttonPreview2 release];
	[buttonPreview3 release];
	[buttonStripped1 release];
	[buttonStripped2 release];
	[buttonStripped3 release];
	[myGallery release];
	[super dealloc];
}

- (void) didView
{
	[buttonStripped1 setEnabled:FALSE];
	[buttonStripped2 setEnabled:FALSE];
	[buttonStripped3 setEnabled:FALSE];
}

- (IBAction) onButtonPreview1:(id)sender
{
}

- (IBAction) onButtonPreview2:(id)sender
{
}

- (IBAction) onButtonPreview3:(id)sender
{
}

- (IBAction) onbuttonStripped1:(id)sender
{
}

- (IBAction) onbuttonStripped2:(id)sender
{
}

- (IBAction) onbuttonStripped3:(id)sender
{
}

@end
