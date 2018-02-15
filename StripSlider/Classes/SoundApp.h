//
//  CSoundApp.h
//  duke
//
//  Created by Dmitriy on 1/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


@interface SoundApp : NSObject <AVAudioPlayerDelegate> {
	AVAudioPlayer *musicPlayer;
	AVAudioPlayer *soundPlayer;
}

-(id)initWhiteForMusic:(NSString*)name;
-(id)initWhiteForSound:(NSString*)name;
-(AVAudioPlayer*)PlayMusic:(NSString*)name;
-(AVAudioPlayer*)PlaySound:(NSString*)name;

+(void)PlayMusic:(NSString*)name;
+(void)StopMusik;
+(void)StopSound;
+(void)PlaySound:(NSString*)name;

@end
