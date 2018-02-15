//
//  MyGallery.h
//
//  Created by Dmitriy on 3/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Girls.h"

@class GallerySlider1;
@class GallerySlider2;
@class StripSliderAppDelegate;

@interface MyGallery : UIView <UIScrollViewDelegate>
{
	UIScrollView *scrollView;
	UIPageControl *pageControl;
	GallerySlider1 *gallerySlider1;
	GallerySlider2 *gallerySlider2;
	StripSliderAppDelegate *stripSliderAppDelegate;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControl;
@property (nonatomic, retain) IBOutlet GallerySlider1 *gallerySlider1;
@property (nonatomic, retain) IBOutlet GallerySlider2 *gallerySlider2;
@property (nonatomic, retain) IBOutlet StripSliderAppDelegate *stripSliderAppDelegate;

- (void) didView;
- (void) selectedGirl:(eGirlsButtons)girl isStripped:(bool)stripped;
- (IBAction) changePage:(id)sender;
- (IBAction) onMenu:(id)sender;


@end
