//
//  GameSlider.h
//
//  Created by Dmitriy on 3/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class GameScreen;

@interface GameSlider : UIView
{
	GameScreen *gameScreen;
	bool isTouches;
	UIImageView *touchesView;
	CGRect movingBox;
	CGRect oldRectBox;
	CGPoint pointTouch;
	bool moved;
	bool moving;
}
@property (nonatomic, retain) IBOutlet GameScreen *gameScreen;
@property (nonatomic, retain) UIImageView *touchesView;

- (void) didView;
- (void) initImages;
- (void) getMovingBox;

- (bool) isCompleted;
- (CGPoint) getPointForTag:(NSInteger)tagNumber;
- (void) PlaySound;
- (NSMutableArray*) RandomShake:(NSMutableArray*)array firstShake:(bool)firstShake;
@end
