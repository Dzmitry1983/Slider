//
//  Girls.m
//  StripSlider
//
//  Created by Dmitriy on 3/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Girls.h"

static Girls *girl = NULL;

@implementation Girls



+ (Girls *)instance
{
	if (!girl)
	{
		girl = [[Girls alloc] init];
		[girl setDificult:kGirlsDificultEasy];
	}
	return girl;
}

- (void) setGirls:(Girls*)girls
{
	if (girl)
	{
		[girl release];
	}
	girl = girls;
	[girl retain];
}

@synthesize isOpenedCheer;
@synthesize isOpenedFootball;
@synthesize isOpenedLib;
@synthesize isOpenedMaid;
@synthesize isOpenedNurse;
@synthesize isOpenedPolice;
@synthesize currentStrip;
@synthesize currentGirl;
@synthesize dificult;
@synthesize sound;
@synthesize moveCount;

@end
