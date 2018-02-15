//
//  Database.h
//  Duke
//
//  Created by Dmitriy on 2/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Girls;

@interface Database : NSObject 
{
	
}

+(Database*) instance;
-(Girls*)getGirlProfile;
-(void)setGirlProfile:(Girls*)girl;

@end


