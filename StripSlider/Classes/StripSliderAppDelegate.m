//
//  StripSliderAppDelegate.m
//  StripSlider
//
//  Created by Dmitriy on 3/11/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "StripSliderAppDelegate.h"
#import "SplashScreen.h"
#import "MyGallery.h"
#import "FullScreen.h"
#import "GameScreen.h"
#import "GameMenu.h"
#import "Database.h"

@implementation StripSliderAppDelegate

@synthesize window;
@synthesize splashScreen;
@synthesize myGallery;
@synthesize fullScreen;
@synthesize gameScreen;
@synthesize gameMenu;

- (void)dealloc
{
	[window release];
	[myGallery release];
	[splashScreen release];
	[fullScreen release];
	[gameScreen release];
	[gameMenu release];
	[super dealloc];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
	[window.rootViewController.view addSubview:splashScreen];
	[splashScreen startTimer];
	Girls *girl = [[Database instance] getGirlProfile];
	if (girl != NULL)
	{
		[[Girls instance] setGirls:girl];
	}
	
    [window makeKeyAndVisible];
}

- (void) setMyGalleryScreen
{
	[window addSubview:myGallery];
	[myGallery didView];
}

- (void) viewGameScreen
{
	[window addSubview:gameScreen];
	if (!fullScreen.isOpenedGame)
	{
		[gameScreen didView];
	}
}

- (void) completeGame
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:(UIView*)window cache:YES];
	[gameScreen removeFromSuperview];
	[fullScreen selectedGirl:[Girls instance].currentGirl isStripped:FALSE];
	[fullScreen setIsGameComplete:TRUE];
	[window addSubview:fullScreen];	
	[UIView commitAnimations];
	[[Database instance] setGirlProfile:[Girls instance]];
}

- (void) completeGamePreview
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:(UIView*)window cache:YES];
	[fullScreen removeFromSuperview];
	[fullScreen selectedGirl:[Girls instance].currentGirl isStripped:TRUE];
	[window addSubview:fullScreen];	
	[UIView commitAnimations];
}

- (void) selectedGirl:(int)girl isStripped:(bool)stripped
{
	[fullScreen selectedGirl:girl isStripped:stripped];
	fullScreen.isOpenedGame = FALSE;
	[fullScreen setIsGameComplete:FALSE];
	[window addSubview:fullScreen];
	
}

- (void) viewPreviewScreen
{
	fullScreen.isOpenedGame = TRUE;
	[fullScreen setIsGameComplete:FALSE];
	[window addSubview:fullScreen];
}

- (void) reloadGame
{
	[gameScreen didView];
}

- (void) viewGameMenu
{
	[gameMenu didView];
	[window addSubview:gameMenu];
}

@end
