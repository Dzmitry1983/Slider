//
//  FullScreen.h
//
//  Created by Dmitriy on 3/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class StripSliderAppDelegate;

@interface FullScreen : UIView
{
	UIImageView *backgroundView;
	UIImageView *backgroundPopupView;
	UIView *popapView;
	UIButton *button;
	StripSliderAppDelegate *stripSliderAppDelegate;
	bool isOpenedGame;
	bool isGameComplete;
}

@property (nonatomic, retain) IBOutlet UIImageView *backgroundView;
@property (nonatomic, retain) IBOutlet UIImageView *backgroundPopupView;
@property (nonatomic, retain) IBOutlet UIView *popapView;
@property (nonatomic, retain) IBOutlet StripSliderAppDelegate *stripSliderAppDelegate;
@property (nonatomic, retain) IBOutlet UIButton *button;
@property (nonatomic, assign) bool isOpenedGame;
@property (nonatomic, assign) bool isGameComplete;

- (void) selectedGirl:(int)girl isStripped:(bool)stripped;

- (IBAction) onShowPopup:(id)sender;
- (IBAction) onPlay:(id)sender;
- (IBAction) onGallery:(id)sender;
- (IBAction) onSave:(id)sender;
- (IBAction) onClose:(id)sender;

- (void) showPopup;
- (void) timerFired:(NSTimer *)timer;

@end
