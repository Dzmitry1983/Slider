//
//  GallerySlider2.m
//
//  Created by Dmitriy on 3/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GallerySlider2.h"
#import "MyGallery.h"
#import "Girls.h"

NSString *stringCheer = @"Gallery_CheerUndress.png";
NSString *stringFootball = @"Gallery_FootballUndress.png";
NSString *stringPolice = @"Gallery_PoliceUndress.png";

@implementation GallerySlider2

- (void) didView
{
	[super didView];
	
	if ([Girls instance].isOpenedPolice)
	{
		[buttonStripped1 setImage:[UIImage imageNamed:stringPolice] forState:UIControlStateNormal];
		[buttonStripped1 setEnabled:TRUE];
	}
	if ([Girls instance].isOpenedFootball)
	{
		[buttonStripped2 setImage:[UIImage imageNamed:stringFootball] forState:UIControlStateNormal];
		[buttonStripped2 setEnabled:TRUE];
	}
	if ([Girls instance].isOpenedCheer)
	{
		[buttonStripped3 setImage:[UIImage imageNamed:stringCheer] forState:UIControlStateNormal];
		[buttonStripped3 setEnabled:TRUE];
	}
	
}

- (IBAction) onButtonPreview1:(id)sender
{
	[myGallery selectedGirl:kGirlsButtonPolice isStripped:FALSE];
}

- (IBAction) onButtonPreview2:(id)sender
{
	[myGallery selectedGirl:kGirlsButtonFootball isStripped:FALSE];
}

- (IBAction) onButtonPreview3:(id)sender
{
	[myGallery selectedGirl:kGirlsButtonCheer isStripped:FALSE];
}

- (IBAction) onbuttonStripped1:(id)sender
{
	[myGallery selectedGirl:kGirlsButtonPolice isStripped:TRUE];
}

- (IBAction) onbuttonStripped2:(id)sender
{
	[myGallery selectedGirl:kGirlsButtonFootball isStripped:TRUE];
}

- (IBAction) onbuttonStripped3:(id)sender
{
	[myGallery selectedGirl:kGirlsButtonCheer isStripped:TRUE];
}

@end
