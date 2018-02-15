//
//  Girls.h
//  StripSlider
//
//  Created by Dmitriy on 3/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum GirlsButtons
{
	kGirlsButtonCheer = 1,
	kGirlsButtonFootball,
	kGirlsButtonLib,
	kGirlsButtonMaid,
	kGirlsButtonNurse,
	kGirlsButtonPolice
} eGirlsButtons;

typedef enum GirlsDificult
{
	kGirlsDificultEasy = 1,
	kGirlsDificultNormal
} eGirlsDificult;

typedef enum GirlsSound
{
	kGirlsSoundOff = 0,
	kGirlsSoundSlide,
	kGirlsSoundSexy
} eGirlsSound;

@interface Girls : NSObject 
{
	bool isOpenedCheer;
	bool isOpenedFootball;
	bool isOpenedLib;
	bool isOpenedMaid;
	bool isOpenedNurse;
	bool isOpenedPolice;
	
	eGirlsButtons currentGirl;
	bool currentStrip;
	
	int moveCount;
	int dificult;
	
	int sound;
}

@property (nonatomic, assign) bool isOpenedCheer;
@property (nonatomic, assign) bool isOpenedFootball;
@property (nonatomic, assign) bool isOpenedLib;
@property (nonatomic, assign) bool isOpenedMaid;
@property (nonatomic, assign) bool isOpenedNurse;
@property (nonatomic, assign) bool isOpenedPolice;
@property (nonatomic, assign) bool currentStrip;
@property (nonatomic, assign) eGirlsButtons currentGirl;
@property (nonatomic, assign) int dificult;
@property (nonatomic, assign) int sound;
@property (nonatomic, assign) int moveCount;

+ (Girls*)instance;

- (void) setGirls:(Girls*)girls;

@end
