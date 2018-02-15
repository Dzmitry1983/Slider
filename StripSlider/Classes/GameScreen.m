//
//  GameScreen.m
//
//  Created by Dmitriy on 3/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GameScreen.h"
#import "StripSliderAppDelegate.h"
#import "Girls.h"

@implementation GameScreen

@synthesize gameSlider;
@synthesize background;
@synthesize timeLabel;
@synthesize movedLabel;
@synthesize stripSliderAppDelegate;
@synthesize dateGame;

- (void) didView
{
	[gameSlider didView];
	if ([Girls instance].dificult == kGirlsDificultEasy)
	{
		[background setImage:[UIImage imageNamed:@"Game_MainScreen1.png"]];
	}
	if ([Girls instance].dificult == kGirlsDificultNormal)
	{
		[background setImage:[UIImage imageNamed:@"Game_MainScreen2.png"]];
	}
	[self updateMoveLabel];
	timeStart = [NSDate timeIntervalSinceReferenceDate];
	timeAdded = 0;
	[self startTimer];
}

- (IBAction) onPrewiew:(id)sender
{
	[stripSliderAppDelegate viewPreviewScreen];
}

- (IBAction) onMenu:(id)sender
{
	[stripSliderAppDelegate viewGameMenu];
}

- (void) updateMoveLabel
{
	[movedLabel setText:[NSString stringWithFormat:@"%05d", [Girls instance].moveCount]];
	//[timeLabel  setText:[NSString stringWithFormat:@"%f", [dateGame timeIntervalSinceNow]]];
}

-(void) startTimer
{
	if (timer)
	{
		[timer invalidate];
		[timer release];
		timer = nil;
	}
	timer = [[NSTimer timerWithTimeInterval:0.2 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES] retain];
	[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
	//[timer release];
}

- (void)timerFired:(NSTimer *)timer
{	
	NSTimeInterval t = [NSDate timeIntervalSinceReferenceDate] - timeStart + timeAdded;
	int h = (int)t / 3600;
	int m = ((int)t / 60) % 60;
	int s = (int)t % 60;
	[timeLabel  setText:[NSString stringWithFormat:@"%02d:%02d:%02d", h, m, s]];
}

- (void) completeGame
{
	switch ([Girls instance].currentGirl)
	{
		case kGirlsButtonCheer:
			[Girls instance].isOpenedCheer = TRUE;
			break;
		case kGirlsButtonFootball:
			[Girls instance].isOpenedFootball = TRUE;
			break;
		case kGirlsButtonLib:
			[Girls instance].isOpenedLib = TRUE;
			break;
		case kGirlsButtonMaid:
			[Girls instance].isOpenedMaid = TRUE;
			break;
		case kGirlsButtonNurse:
			[Girls instance].isOpenedNurse = TRUE;
			break;
		case kGirlsButtonPolice:
			[Girls instance].isOpenedPolice = TRUE;
			break;
		default:
			break;
	}
	[stripSliderAppDelegate completeGame];
	
}

- (void) dealloc
{
	[gameSlider release];
	[background release];
	[timeLabel release];
	[movedLabel release];
	[stripSliderAppDelegate release];
	[dateGame release];
	[super dealloc];
}


@end
