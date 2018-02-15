//
//  GallerySliderSuperclass.h
//  StripSlider
//
//  Created by Dmitriy on 3/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Girls.h"

@class MyGallery;

@interface GallerySliderSuperclass : UIView 
{
	UIButton *buttonPreview1;
	UIButton *buttonPreview2;
	UIButton *buttonPreview3;
	UIButton *buttonStripped1;
	UIButton *buttonStripped2;
	UIButton *buttonStripped3;
	MyGallery *myGallery;
}

@property (nonatomic, retain) IBOutlet UIButton *buttonPreview1;
@property (nonatomic, retain) IBOutlet UIButton *buttonPreview2;
@property (nonatomic, retain) IBOutlet UIButton *buttonPreview3;
@property (nonatomic, retain) IBOutlet UIButton *buttonStripped1;
@property (nonatomic, retain) IBOutlet UIButton *buttonStripped2;
@property (nonatomic, retain) IBOutlet UIButton *buttonStripped3;
@property (nonatomic, retain) IBOutlet MyGallery *myGallery;

- (IBAction) onButtonPreview1:(id)sender;
- (IBAction) onButtonPreview2:(id)sender;
- (IBAction) onButtonPreview3:(id)sender;
- (IBAction) onbuttonStripped1:(id)sender;
- (IBAction) onbuttonStripped2:(id)sender;
- (IBAction) onbuttonStripped3:(id)sender;

- (void) didView;

@end
