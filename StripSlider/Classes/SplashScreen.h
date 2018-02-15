//
//  SplashScreen.h
//
//  Created by Dmitriy on 3/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class StripSliderAppDelegate;

@interface SplashScreen : UIView
{
	StripSliderAppDelegate *stripSliderAppDelegate;
}

@property (nonatomic, retain) IBOutlet StripSliderAppDelegate *stripSliderAppDelegate;

- (void) startTimer;
- (void) timerFired:(NSTimer *)timer;

@end
