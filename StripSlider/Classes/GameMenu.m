//
//  GameMenu.m
//
//  Created by Dmitriy on 3/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GameMenu.h"
#import "Girls.h"
#import "StripSliderAppDelegate.h"
#import "Database.h"

@implementation GameMenu

@synthesize stripSliderAppDelegate;
@synthesize buttonLevelEasy;
@synthesize buttonLevelNormal;
@synthesize buttonSlide;
@synthesize buttonSexy;
@synthesize buttonOff;

- (void) dealloc
{
	[buttonLevelEasy release];
	[buttonLevelNormal release];
	[buttonSlide release];
	[buttonSexy release];
	[buttonOff release];
	[stripSliderAppDelegate release];
	[super dealloc];
}

- (void) didView
{
	[self setAllButtons];
}

- (IBAction) onGallery:(id)sender
{
	[self removeFromSuperview];
	[stripSliderAppDelegate setMyGalleryScreen];
}

- (IBAction) onClose:(id)sender
{
	[self removeFromSuperview];
}

- (IBAction) onLevelEasy:(id)sender
{
	[Girls instance].dificult = kGirlsDificultEasy;
	[self setAllButtons];
	[stripSliderAppDelegate reloadGame];
}

- (IBAction) onLevelNormal:(id)sender
{
	[Girls instance].dificult = kGirlsDificultNormal;
	[self setAllButtons];
	[stripSliderAppDelegate reloadGame];
}

- (IBAction) onSoundSlide:(id)sender
{
	[Girls instance].sound = kGirlsSoundSlide;
	[self setAllButtons];
}

- (IBAction) onSoundSexy:(id)sender
{
	[Girls instance].sound = kGirlsSoundSexy;
	[self setAllButtons];
}

- (IBAction) onSoundOff:(id)sender
{
	[Girls instance].sound = kGirlsSoundOff;
	[self setAllButtons];
}

- (void) setAllButtons
{
	NSString *unchecked = @"BtnUnchecked.png";
	NSString *cheked = @"BtnChecked.png";
	
	[[Database instance] setGirlProfile:[Girls instance]];
	
	[buttonLevelEasy setImage:[UIImage imageNamed:unchecked] forState:UIControlStateNormal];
	[buttonLevelNormal setImage:[UIImage imageNamed:unchecked] forState:UIControlStateNormal];
	[buttonSlide setImage:[UIImage imageNamed:unchecked] forState:UIControlStateNormal];
	[buttonSexy setImage:[UIImage imageNamed:unchecked] forState:UIControlStateNormal];
	[buttonOff setImage:[UIImage imageNamed:unchecked] forState:UIControlStateNormal];
	
	switch ([Girls instance].sound)
	{
		case kGirlsSoundOff:
			[buttonOff setImage:[UIImage imageNamed:cheked] forState:UIControlStateNormal];
			break;
		case kGirlsSoundSlide:
			[buttonSlide setImage:[UIImage imageNamed:cheked] forState:UIControlStateNormal];
			break;
		case kGirlsSoundSexy:
			[buttonSexy setImage:[UIImage imageNamed:cheked] forState:UIControlStateNormal];
			break;
		default:
			break;
	}
	
	
	switch ([Girls instance].dificult)
	{
		case kGirlsDificultEasy:
			[buttonLevelEasy setImage:[UIImage imageNamed:cheked] forState:UIControlStateNormal];
			break;
		case kGirlsDificultNormal:
			[buttonLevelNormal setImage:[UIImage imageNamed:cheked] forState:UIControlStateNormal];
			break;
		default:
			break;
	}
}

@end
