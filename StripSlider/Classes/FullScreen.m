//
//  FullScreen.m
//
//  Created by Dmitriy on 3/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FullScreen.h"
#import "Girls.h"
#import "StripSliderAppDelegate.h"
#import "SoundApp.h"

NSString *girlsPreview_1 = @"GirlsPreview_MaidDressed.png";
NSString *girlsPreview_2 = @"GirlsPreview_NurseDressed.png";
NSString *girlsPreview_3 = @"GirlsPreview_LibDressed.png";
NSString *girlsPreview_4 = @"GirlsPreview_CheerDressed.png";
NSString *girlsPreview_5 = @"GirlsPreview_FootballDressed.png";
NSString *girlsPreview_6 = @"GirlsPreview_PoliceDressed.png";
NSString *girlsPreview_s1 = @"GirlsPreview_MaidUndressed.png";
NSString *girlsPreview_s2 = @"GirlsPreview_NurseUndressed.png";
NSString *girlsPreview_s3 = @"GirlsPreview_LibUndressed.png";
NSString *girlsPreview_s4 = @"GirlsPreview_CheerUndressed.png";
NSString *girlsPreview_s5 = @"GirlsPreview_FootballUndressed.png";
NSString *girlsPreview_s6 = @"GirlsPreview_PoliceUndressed.png";


@implementation FullScreen

@synthesize backgroundView;
@synthesize popapView;
@synthesize stripSliderAppDelegate;
@synthesize isOpenedGame;
@synthesize isGameComplete;
@synthesize backgroundPopupView;
@synthesize button;

- (void) dealloc
{
	[backgroundView release];
	[backgroundPopupView release];
	[popapView release];
	[stripSliderAppDelegate release];
	[button release];
	[super dealloc];
}

- (void) selectedGirl:(int)girl isStripped:(bool)stripped
{
	NSString *imageName = NULL;
	if (stripped)
	{
		switch (girl)
		{
			case kGirlsButtonMaid:
				imageName = girlsPreview_s1;
				break;
			case kGirlsButtonNurse:
				imageName = girlsPreview_s2;
				break;
			case kGirlsButtonLib:
				imageName = girlsPreview_s3;
				break;
			case kGirlsButtonCheer:
				imageName = girlsPreview_s4;
				break;
			case kGirlsButtonFootball:
				imageName = girlsPreview_s5;
				break;
			case kGirlsButtonPolice:
				imageName = girlsPreview_s6;
				break;
			default:
				break;
		}
	}
	else
	{
		switch (girl)
		{
			case kGirlsButtonMaid:
				imageName = girlsPreview_1;
				break;
			case kGirlsButtonNurse:
				imageName = girlsPreview_2;
				break;
			case kGirlsButtonLib:
				imageName = girlsPreview_3;
				break;
			case kGirlsButtonCheer:
				imageName = girlsPreview_4;
				break;
			case kGirlsButtonFootball:
				imageName = girlsPreview_5;
				break;
			case kGirlsButtonPolice:
				imageName = girlsPreview_6;
				break;
			default:
				break;
		}
	}
	[backgroundView setImage:[UIImage imageNamed:imageName]];
	[backgroundPopupView setHidden:TRUE];
	[button setEnabled:TRUE];
}

- (IBAction) onShowPopup:(id)sender
{
	if (isGameComplete)
	{
		isGameComplete = FALSE;
		isOpenedGame = FALSE;
		[self showPopup];
	}
	else
	{
		if (!isOpenedGame)
		{
			[popapView setHidden:FALSE];
		}
		else 
		{
			[self removeFromSuperview];
			[stripSliderAppDelegate viewGameScreen];
		}
	}
}

- (void) showPopup
{
	NSString *path = NULL;
	switch (rand()%3) {
		case 0:
			path = @"PopupEndGame_Best.png";
			break;
		case 1:
			path = @"PopupEndGame_Love.png";
			break;
		case 2:
			path = @"PopupEndGame_Strip.png";
			break;
		default:
			break;
	}
	[backgroundPopupView setImage:[UIImage imageNamed:path]];
	[backgroundPopupView setHidden:FALSE];
	[button setEnabled:FALSE];
	
	int number = rand() % 7;
	number++;
	NSString *sound = [NSString stringWithFormat:@"Sexy Sigh-0%d.wav", number];
	[SoundApp PlaySound:sound];
	
	NSTimer *timer = [[NSTimer timerWithTimeInterval:4.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:NO] retain];
	[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];	
}

- (void)timerFired:(NSTimer *)timer
{
	[timer invalidate];
	[timer release];
	timer = nil;
	[stripSliderAppDelegate completeGamePreview];	
}

- (IBAction) onPlay:(id)sender
{
	[popapView setHidden:TRUE];
	[self removeFromSuperview];
	[stripSliderAppDelegate viewGameScreen];
}

- (IBAction) onGallery:(id)sender
{
	[popapView setHidden:TRUE];
	[self removeFromSuperview];
	[stripSliderAppDelegate setMyGalleryScreen];
}

- (IBAction) onSave:(id)sender
{
	[popapView setHidden:TRUE];
	UIImageWriteToSavedPhotosAlbum([backgroundView image], NULL, NULL, NULL);
}

- (IBAction) onClose:(id)sender
{
	[popapView setHidden:TRUE];
}

@end
