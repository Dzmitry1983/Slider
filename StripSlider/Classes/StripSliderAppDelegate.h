//
//  StripSliderAppDelegate.h
//  StripSlider
//
//  Created by Dmitriy on 3/11/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SplashScreen;
@class MyGallery;
@class FullScreen;
@class GameScreen;
@class GameMenu;

@interface StripSliderAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	SplashScreen *splashScreen;
	MyGallery *myGallery;
	FullScreen *fullScreen;
	GameScreen *gameScreen;
	GameMenu *gameMenu;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SplashScreen *splashScreen;
@property (nonatomic, retain) IBOutlet MyGallery *myGallery;
@property (nonatomic, retain) IBOutlet FullScreen *fullScreen;
@property (nonatomic, retain) IBOutlet GameScreen *gameScreen;
@property (nonatomic, retain) IBOutlet GameMenu *gameMenu;

- (void) setMyGalleryScreen;

- (void) viewGameMenu;
- (void) viewGameScreen;
- (void) selectedGirl:(int)girl isStripped:(bool)stripped;
- (void) viewPreviewScreen;
- (void) completeGame;
- (void) completeGamePreview;
- (void) reloadGame;

@end

