//
//  Database.m
//  Duke
//
//  Created by Dmitriy on 2/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Database.h"
#import "Girls.h"

static Database* databaseSharedInstance;

@implementation Database

+(Database*) instance
{
	if(databaseSharedInstance==nil)
	{
		databaseSharedInstance = [[Database alloc] init];
	}
	return databaseSharedInstance;
}

-(Girls*)getGirlProfile
{
    NSArray *appPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [appPaths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"database.plist"];
	
	NSMutableDictionary* girlProp = [[[NSMutableDictionary alloc] initWithContentsOfFile:filePath] autorelease];

	if (girlProp)
	{				
		Girls *girl = [[[Girls alloc] init] autorelease];
		girl.isOpenedCheer = [[girlProp objectForKey:@"isOpenedCheer"] boolValue];
		girl.isOpenedFootball = [[girlProp objectForKey:@"isOpenedFootball"] boolValue];
		girl.isOpenedLib = [[girlProp objectForKey:@"isOpenedLib"] boolValue];
		girl.isOpenedMaid = [[girlProp objectForKey:@"isOpenedMaid"] boolValue];
		girl.isOpenedNurse = [[girlProp objectForKey:@"isOpenedNurse"] boolValue];
		girl.isOpenedPolice = [[girlProp objectForKey:@"isOpenedPolice"] boolValue];
		girl.dificult = [[girlProp objectForKey:@"dificult"] intValue];
		girl.sound = [[girlProp objectForKey:@"sound"] intValue];
		return girl;
	}
	return nil;
}


-(void)setGirlProfile:(Girls*)girl
{	
	NSMutableDictionary* girlProp = [NSMutableDictionary dictionary];
	[girlProp setObject:[NSNumber numberWithBool:girl.isOpenedCheer] forKey:@"isOpenedCheer"];
	[girlProp setObject:[NSNumber numberWithBool:girl.isOpenedFootball] forKey:@"isOpenedFootball"];
	[girlProp setObject:[NSNumber numberWithBool:girl.isOpenedLib] forKey:@"isOpenedLib"];
	[girlProp setObject:[NSNumber numberWithInt:girl.isOpenedMaid] forKey:@"isOpenedMaid"];
	[girlProp setObject:[NSNumber numberWithInt:girl.isOpenedNurse] forKey:@"isOpenedNurse"];
	[girlProp setObject:[NSNumber numberWithInt:girl.isOpenedPolice] forKey:@"isOpenedPolice"];
	
	[girlProp setObject:[NSNumber numberWithInt:girl.dificult] forKey:@"dificult"];
	[girlProp setObject:[NSNumber numberWithInt:girl.sound] forKey:@"sound"];

    NSArray *appPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [appPaths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"database.plist"];
	NSString* errorMsg = nil;
	NSData* data  = [NSPropertyListSerialization dataFromPropertyList:girlProp format:NSPropertyListXMLFormat_v1_0 errorDescription:&errorMsg];
	
	[data writeToFile:filePath atomically:YES];
}


@end
