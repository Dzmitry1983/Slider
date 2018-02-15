//
//  GameScreen.h
//
//  Created by Dmitriy on 3/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class GameSlider;
@class StripSliderAppDelegate;

@interface GameScreen : UIView
{
	UIImageView *background;
	UILabel *timeLabel;
	UILabel *movedLabel;
	GameSlider* gameSlider;
	StripSliderAppDelegate *stripSliderAppDelegate;
	NSDate *dateGame;
	NSTimeInterval timeAdded;
	NSTimeInterval timeStart;
	NSTimer *timer;
}

@property (nonatomic, retain) IBOutlet UIImageView *background;
@property (nonatomic, retain) IBOutlet UILabel *timeLabel;
@property (nonatomic, retain) IBOutlet UILabel *movedLabel;
@property (nonatomic, retain) IBOutlet GameSlider* gameSlider;
@property (nonatomic, retain) IBOutlet StripSliderAppDelegate *stripSliderAppDelegate;
@property (nonatomic, retain) NSDate *dateGame;

- (IBAction) onPrewiew:(id)sender;
- (IBAction) onMenu:(id)sender;

- (void) didView;
- (void) updateMoveLabel;
- (void) completeGame;

- (void) startTimer;
- (void) timerFired:(NSTimer *)timer;

@end
