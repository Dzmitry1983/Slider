//
//  SplashScreen.m
//
//  Created by Dmitriy on 3/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SplashScreen.h"
#import "StripSliderAppDelegate.h"

@implementation SplashScreen

@synthesize stripSliderAppDelegate;

-(void) startTimer
{
	NSTimer *timer = [[NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:NO] retain];
	[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
	//[timer release];
}

- (void)timerFired:(NSTimer *)timer
{
	[timer invalidate];
	[timer release];
	timer = nil;
	[self removeFromSuperview];
	[stripSliderAppDelegate setMyGalleryScreen];
}

-(void) dealloc
{
	[stripSliderAppDelegate release];
	[super dealloc];
}

@end
