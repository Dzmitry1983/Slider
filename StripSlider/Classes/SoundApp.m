//
//  CSoundApp.m
//  duke
//
//  Created by Dmitriy on 1/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SoundApp.h"


@implementation SoundApp

-(id)initWhiteForMusic:(NSString*)name
{
	self = [super init];
	if (self != nil) {
		@synchronized(self)
		{
			static AVAudioPlayer* musicPlayerVar = NULL;
			static SoundApp *soundApp = NULL;
			if (soundApp)
			{
				[soundApp release];
			}
			soundApp = self;
			[soundApp retain];
			if (name)
			{
				if (musicPlayerVar)
				{
					[musicPlayerVar stop];
					[musicPlayerVar release];
				}
				musicPlayerVar = [self PlayMusic:name];
			}
			else
			{
				if (musicPlayerVar)
				{
					[musicPlayerVar stop];
					[musicPlayerVar release];
					musicPlayerVar = NULL;
				}
				musicPlayer = musicPlayerVar;
			}
		}
		
	}
	return self;
}

-(id)initWhiteForSound:(NSString*)name
{
	self = [super init];
	if (self != nil) {
		@synchronized(self)
		{
			static AVAudioPlayer* soundPlayerVar = NULL;
			if (name)
			{
				if (soundPlayerVar)
				{
					[soundPlayerVar stop];
					[soundPlayerVar release];
				}
				soundPlayerVar = [self PlaySound:name];
			}
			else
			{
				if (soundPlayerVar)
				{
					[soundPlayerVar stop];
					[soundPlayerVar release];
					soundPlayerVar = NULL;
				}
				soundPlayer = soundPlayerVar;
			}
		}
		
	}
	return self;
}

- (id) init
{
	return [self initWhiteForMusic:NULL];
	
	//return self;
}

- (void) dealloc
{
	[super dealloc];
}

-(AVAudioPlayer*)PlayMusic:(NSString*)name
{
	NSError *error;
	NSString *path = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], name];
	NSData *data = [NSData dataWithContentsOfFile:path];
	musicPlayer = [[AVAudioPlayer alloc]  initWithData:data error:&error];
	[musicPlayer setDelegate:self];
	//[musicPlayer setVolume:0.5];
	[musicPlayer play];
	[musicPlayer isPlaying];
	return musicPlayer;
}

-(AVAudioPlayer*)PlaySound:(NSString*)name
{
	NSError *error;
	NSData *data = [NSData dataWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], name]];
	soundPlayer = [[AVAudioPlayer alloc]  initWithData:data error:&error];
	[soundPlayer play];
	return soundPlayer;
}

+(void)PlayMusic:(NSString*)name
{
	SoundApp *sound = [[SoundApp alloc] initWhiteForMusic:name];	
	[sound release];
}

+(void)StopMusik
{
	SoundApp *sound = [[SoundApp alloc] init];	
	[sound release];
}

+(void)StopSound
{
	SoundApp *sound = [[SoundApp alloc] initWhiteForSound:NULL];	
	[sound release];
}

+(void)PlaySound:(NSString*)name
{
	SoundApp *sound = [[SoundApp alloc] initWhiteForSound:name];	
	[sound release];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
	if (flag)
	{
		[player play];
	}
}

@end
