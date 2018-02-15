//
//  GameMenu.h
//
//  Created by Dmitriy on 3/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class StripSliderAppDelegate;

@interface GameMenu : UIView
{
	UIButton *buttonLevelEasy;
	UIButton *buttonLevelNormal;
	UIButton *buttonSlide;
	UIButton *buttonSexy;
	UIButton *buttonOff;
	StripSliderAppDelegate *stripSliderAppDelegate;
}

@property (nonatomic, retain) IBOutlet UIButton *buttonLevelEasy;
@property (nonatomic, retain) IBOutlet UIButton *buttonLevelNormal;
@property (nonatomic, retain) IBOutlet UIButton *buttonSlide;
@property (nonatomic, retain) IBOutlet UIButton *buttonSexy;
@property (nonatomic, retain) IBOutlet UIButton *buttonOff;
@property (nonatomic, retain) IBOutlet StripSliderAppDelegate *stripSliderAppDelegate;



- (IBAction) onGallery:(id)sender;
- (IBAction) onClose:(id)sender;

- (IBAction) onLevelEasy:(id)sender;
- (IBAction) onLevelNormal:(id)sender;

- (IBAction) onSoundSlide:(id)sender;
- (IBAction) onSoundSexy:(id)sender;
- (IBAction) onSoundOff:(id)sender;

- (void) didView;

- (void) setAllButtons;

@end
