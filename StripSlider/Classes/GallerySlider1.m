//
//  GallerySlider1.m
//
//  Created by Dmitriy on 3/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GallerySlider1.h"
#import "MyGallery.h"
#import "Girls.h"

@implementation GallerySlider1

NSString *stringMaid = @"Gallery_MaidUndress.png";
NSString *stringNurse = @"Gallery_NurseUndress.png";
NSString *stringLib = @"Gallery_LibUndress.png";

- (void) didView
{
	[super didView];
	
	if ([Girls instance].isOpenedMaid)
	{
		[buttonStripped1 setImage:[UIImage imageNamed:stringMaid] forState:UIControlStateNormal];
		[buttonStripped1 setEnabled:TRUE];
	}
	if ([Girls instance].isOpenedNurse)
	{
		[buttonStripped2 setImage:[UIImage imageNamed:stringNurse] forState:UIControlStateNormal];
		[buttonStripped2 setEnabled:TRUE];
	}
	if ([Girls instance].isOpenedLib)
	{
		[buttonStripped3 setImage:[UIImage imageNamed:stringLib] forState:UIControlStateNormal];
		[buttonStripped3 setEnabled:TRUE];
	}
	
}

- (IBAction) onButtonPreview1:(id)sender
{
	[myGallery selectedGirl:kGirlsButtonMaid isStripped:FALSE];
}

- (IBAction) onButtonPreview2:(id)sender
{
	[myGallery selectedGirl:kGirlsButtonNurse isStripped:FALSE];
}

- (IBAction) onButtonPreview3:(id)sender
{
	[myGallery selectedGirl:kGirlsButtonLib isStripped:FALSE];
}

- (IBAction) onbuttonStripped1:(id)sender
{
	[myGallery selectedGirl:kGirlsButtonMaid isStripped:TRUE];
}

- (IBAction) onbuttonStripped2:(id)sender
{
	[myGallery selectedGirl:kGirlsButtonNurse isStripped:TRUE];
}

- (IBAction) onbuttonStripped3:(id)sender
{
	[myGallery selectedGirl:kGirlsButtonLib isStripped:TRUE];
}

@end
