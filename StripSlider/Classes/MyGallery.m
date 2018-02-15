//
//  MyGallery.m
//
//  Created by Dmitriy on 3/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyGallery.h"
#import "StripSliderAppDelegate.h"

@implementation MyGallery

@synthesize scrollView;
@synthesize pageControl;
@synthesize gallerySlider1;
@synthesize gallerySlider2;
@synthesize stripSliderAppDelegate;

const CGSize scrollViewSize = {640, 400};

- (void) didView
{
	[scrollView setContentSize:scrollViewSize];
	[gallerySlider1 didView];
	[gallerySlider2 didView];
}

- (void) selectedGirl:(EGirlsButtons)girl isStripped:(bool)stripped
{
	[self removeFromSuperview];
	[Girls instance].currentGirl = girl;
	[stripSliderAppDelegate selectedGirl:girl isStripped:stripped];
}

- (IBAction) onMenu:(id)sender
{
	[stripSliderAppDelegate viewGameMenu];
}

- (IBAction)changePage:(id)sender 
{	
	CGPoint point = [scrollView contentOffset];
	point.x = pageControl.currentPage * [scrollView frame].size.width;		
	[scrollView setContentOffset:point animated:TRUE];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollViewCurrent
{
	pageControl.currentPage = [scrollViewCurrent contentOffset].x / [scrollViewCurrent frame].size.width;
}

- (void) dealloc
{
	[scrollView release];
	[pageControl release];
	[gallerySlider1 release];
	[gallerySlider2 release];
	[stripSliderAppDelegate release];
	[super dealloc];
}

@end
