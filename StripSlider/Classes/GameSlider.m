//
//  GameSlider.m
//
//  Created by Dmitriy on 3/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GameSlider.h"
#import "Girls.h"
#import "GameScreen.h"
#import "SoundApp.h"

@implementation GameSlider

@synthesize touchesView;
@synthesize gameScreen;

- (void) didView
{	
	for (UIView *vi in [self subviews])
	{
		[vi removeFromSuperview];
	}
	
	CGRect rect1 = [self frame];
	
	if ([Girls instance].dificult == kGirlsDificultEasy)
	{
		rect1.size.width = 306;
		rect1.size.height = 420;
	}
	
	if ([Girls instance].dificult == kGirlsDificultNormal)
	{
		rect1.size.width = 304;
		rect1.size.height = 420;
	}
	
	rect1.origin.x = (320 - rect1.size.width) / 2;
	[self setFrame:rect1];

	[Girls instance].moveCount = 0;
	movingBox = CGRectZero;
	movingBox.size.width = 100;
	[self initImages];
	moving = FALSE;
}

- (void) initImages
{
	NSMutableArray *array = [[NSMutableArray alloc] init];
	NSMutableArray *arrayRandom = [[NSMutableArray alloc] init];
	NSString *girlName = NULL;

	switch ([Girls instance].currentGirl)
	{
		case kGirlsButtonCheer:
			girlName = @"Cheerleader_";
			break;
		case kGirlsButtonFootball:
			girlName = @"Football_";
			break;
		case kGirlsButtonLib:
			girlName = @"Librarian_";
			break;
		case kGirlsButtonMaid:
			girlName = @"Maid_";
			break;
		case kGirlsButtonNurse:
			girlName = @"Nurse_";
			break;
		case kGirlsButtonPolice:
			girlName = @"Police_";
			break;
		default:
			break;
	}
	
	if ([Girls instance].dificult == kGirlsDificultEasy)
	{
		for (int i = 1; i <= 9; i++)
		{
			NSString *path = [NSString stringWithFormat:@"%@MainScreen1-%02d.png", girlName, i];
			UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:path]];
			[iv setTag:i];
			[array addObject:iv];
			[iv release];
		}
	}
	
	if ([Girls instance].dificult == kGirlsDificultNormal)
	{
		for (int i = 1; i <= 16; i++)
		{
			NSString *path = [NSString stringWithFormat:@"%@MainScreen16_%02d.png", girlName, i];
			UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:path]];
			[iv setTag:i];
			[array addObject:iv];
			[iv release];
		}
	}
	/*
	while ([array count])
	{
		int random = rand() % [array count];
		[arrayRandom addObject:[array objectAtIndex:random]];
		[array removeObjectAtIndex:random];
	}
	*/
	
	[self RandomShake:array firstShake:TRUE];
	
	for (int i = 0; i < [array count]; i++)
	{
		[self RandomShake:array firstShake:FALSE];
	}
	
	[arrayRandom addObjectsFromArray:array];
	CGRect oldRect = CGRectZero;
	for (int i = 0; i < [arrayRandom count]; i++)
	{
		UIImageView *vi = [arrayRandom objectAtIndex:i];
		CGRect currentR = [vi frame];
		if 
		([self frame].size.width < (oldRect.origin.x + currentR.size.width))
		{
			oldRect.origin.x = 0;
			oldRect.origin.y += currentR.size.height;
		}
		currentR.origin.x = oldRect.origin.x;
		currentR.origin.y = oldRect.origin.y;
		
		[vi setFrame:currentR];
		
		oldRect.origin.x += currentR.size.width;
		
		if ([[arrayRandom objectAtIndex:i] tag] == [arrayRandom count])
		{
			continue;
		}

		[self addSubview:vi];
	}
	
	[arrayRandom release];
	[array release];
}

- (NSMutableArray*) RandomShake:(NSMutableArray*)array firstShake:(bool)firstShake
{
	static int number = 0;
	if (firstShake)
	{
		number = 0;
	}
	int numberLine = sqrt([array count]);
	int numberZero = 0;
	int lineZero = 0;
	int collumnZero = 0;
	int shake[4] = {-1, -1, -1, -1};
	NSMutableArray *numbersForShake = [[NSMutableArray alloc] init];
	
	for (int i = 0; i < [array count]; i++)
	{
		if ([[array objectAtIndex:i] tag] == [array count] )
		{
			numberZero = i;
			lineZero = numberZero / numberLine;
			collumnZero = numberZero % numberLine;
			break;
		}
	}
	
	if (lineZero > 0)
	{
		shake[0] = ((lineZero - 1) * numberLine) + collumnZero;
	}
	if (collumnZero > 0)
	{
		shake[1] = (lineZero * numberLine) + collumnZero - 1;
	}
	if ((collumnZero + 1) < numberLine)
	{
		shake[2] = (lineZero * numberLine) + collumnZero + 1;
	}
	if ((lineZero + 1) < numberLine)
	{
		shake[3] = ((lineZero + 1) * numberLine) + collumnZero;
	}
	
	for (int i = 0; i < 4; i++)
	{
		if ((shake[i] >= 0) && (shake[i] < [array count]))
		{
			if (shake[i] == number)
			{
				continue;			 
			}
			[numbersForShake addObject:[NSNumber numberWithInt:shake[i]]];
		}
	}
	int addedR = [NSDate timeIntervalSinceReferenceDate];
	addedR = (abs(addedR)) % 10;
	int r = (rand() + addedR) % [numbersForShake count];
	number = [[numbersForShake objectAtIndex:r] longValue];
	[array exchangeObjectAtIndex:number withObjectAtIndex:numberZero];
	number = numberZero;
	[numbersForShake release];
	return array;
}

- (bool) isCompleted
{
	bool returnValue = TRUE;
	

	for (UIView *vi in [self subviews])
	{
		if (!CGRectContainsPoint([vi frame], [self getPointForTag:[vi tag]]))
		{
			returnValue = FALSE;
			break;
		}
	}
	
	return returnValue;
}

- (CGPoint) getPointForTag:(NSInteger)tagNumber
{
	CGRect rect = [self frame];
	int x = 0;
	int y = 0;
	int count = 0;
	CGPoint returnValue;
	if ([Girls instance].dificult == kGirlsDificultEasy)
	{
		count = 3;
	}
	if ([Girls instance].dificult == kGirlsDificultNormal)
	{
		count = 4;
	}
	while (tagNumber > count)
	{
		y++;
		tagNumber -= count;
	}
	x = tagNumber - 1;
	returnValue.x = (rect.size.width / count) * x + (rect.size.width / count)/2;
	returnValue.y = (rect.size.height / count) * y + (rect.size.height / count)/2;
	return returnValue;
	
}

- (void) getMovingBox
{
	CGRect rectHorizontal = [touchesView frame];
	CGRect rectVertical = [touchesView frame];
	rectHorizontal.origin.x = 0;
	rectHorizontal.size.width = [self frame].size.width;
	rectVertical.origin.y = 0;
	rectVertical.size.height = [self frame].size.height;
	
	for(UIView *vi in [self subviews])
	{
		if (vi == touchesView)
		{
			continue;
		}
		CGPoint point;
		point.x = [vi frame].origin.x + [vi frame].size.width / 2;
		point.y = [vi frame].origin.y + [vi frame].size.height / 2;
		
		if (CGRectContainsPoint(rectHorizontal ,point)) 
		{
			if (point.x < [touchesView frame].origin.x)
			{
				if (rectHorizontal.origin.x < ([vi frame].origin.x + [vi frame].size.width))
				{
					rectHorizontal.size.width -= [vi frame].origin.x + [vi frame].size.width - rectHorizontal.origin.x;
					rectHorizontal.origin.x = [vi frame].origin.x + [vi frame].size.width;
				}
			}
			else
			{
				if ((rectHorizontal.origin.x + rectHorizontal.size.width) > [vi frame].origin.x)
				{
					rectHorizontal.size.width = [vi frame].origin.x - rectHorizontal.origin.x;
				}
			}
		}
		
		if (CGRectContainsPoint(rectVertical ,point)) 
		{
			if (point.y < [touchesView frame].origin.y)
			{
				if (rectVertical.origin.y < ([vi frame].origin.y + [vi frame].size.height))
				{
					rectVertical.size.height -= [vi frame].origin.y + [vi frame].size.height - rectVertical.origin.y;
					rectVertical.origin.y = [vi frame].origin.y + [vi frame].size.height;
				}
			}
			else
			{
				if ((rectVertical.origin.y + rectVertical.size.height) > [vi frame].origin.y)
				{
					rectVertical.size.height = [vi frame].origin.y - rectVertical.origin.y;
				}
			}
		}		
	}
	
	movingBox.origin.x = rectHorizontal.origin.x;
	movingBox.origin.y = rectVertical.origin.y;
	movingBox.size.width = rectHorizontal.size.width - [touchesView frame].size.width;
	movingBox.size.height = rectVertical.size.height - [touchesView frame].size.height;
}

- (void) PlaySound
{
	int number = 0;
	NSString *sound = @"";
	switch ([Girls instance].sound)
	{
		case kGirlsSoundOff:
			break;
		case kGirlsSoundSlide:
			[SoundApp PlaySound:@"Tap Sound.wav"];
			break;
		case kGirlsSoundSexy:
			number = rand() % 7;
			number++;
			sound = [NSString stringWithFormat:@"Sexy Sigh-0%d.wav", number];
			[SoundApp PlaySound:sound];
			break;
		default:
			break;
	}
	
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	@synchronized (self)
	{
		if (([[event allTouches] count] == 1) && (moving == FALSE))
		{
			NSArray *t = [[event allTouches] allObjects];
			
			int x = [[t objectAtIndex:0] locationInView:self].x;
			int y = [[t objectAtIndex:0] locationInView:self].y;
			
			for (UIView *vi in [self subviews])
			{
				if (CGRectContainsPoint([vi frame], [[t objectAtIndex:0] locationInView:self]))
				{
					touchesView = (UIImageView*)vi;
					break;
				}
			}
			
			if (CGRectContainsPoint([touchesView frame], [[t objectAtIndex:0] locationInView:self]))
			{
				pointTouch.x = x - [touchesView frame].origin.x;
				pointTouch.y = y - [touchesView frame].origin.y;
				oldRectBox = [touchesView frame];
				moved = FALSE;
				
				isTouches = TRUE;
				[self getMovingBox];
				
			}
			
		}
	}	
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	
	if (([[event allTouches] count] == 1) )
	{
		NSArray *t = [[event allTouches] allObjects];
		moved = TRUE;
		int x = [[t objectAtIndex:0] locationInView:self].x;
		int y = [[t objectAtIndex:0] locationInView:self].y;
		if (isTouches)
		{
			CGRect newFrame = [touchesView frame];
			newFrame.origin.x = x - pointTouch.x;
			newFrame.origin.y = y - pointTouch.y;
			if (newFrame.origin.x < movingBox.origin.x)
			{
				newFrame.origin.x = movingBox.origin.x;
			}
			if (newFrame.origin.y < movingBox.origin.y)
			{
				newFrame.origin.y = movingBox.origin.y;
			}
			if (newFrame.origin.x > (movingBox.origin.x + movingBox.size.width))
			{
				newFrame.origin.x = (movingBox.origin.x + movingBox.size.width);
			}
			if (newFrame.origin.y > (movingBox.origin.y + movingBox.size.height))
			{
				newFrame.origin.y = (movingBox.origin.y + movingBox.size.height);
			}
			[touchesView setFrame:newFrame];
		}
		
	}
	
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	
	if (([[event allTouches] count] == 1) )
	{
		NSArray *t = [[event allTouches] allObjects];
		
		if (!moved)
		{
			touchesView = NULL;
			
			int x = [[t objectAtIndex:0] locationInView:self].x;
			int y = [[t objectAtIndex:0] locationInView:self].y;
			
			for (UIView *vi in [self subviews])
			{
				if (CGRectContainsPoint([vi frame], [[t objectAtIndex:0] locationInView:self]))
				{
					touchesView = (UIImageView*)vi;
					break;
				}
			}
			if (touchesView != NULL)
			{
				pointTouch.x = x - [touchesView frame].origin.x;
				pointTouch.y = y - [touchesView frame].origin.y;
				[self getMovingBox];
				
				if (movingBox.size.width || movingBox.size.height)
				{
					CGRect oldRect = [touchesView frame];
					oldRect.origin.x = (oldRect.origin.x != movingBox.origin.x)?movingBox.origin.x:(movingBox.origin.x + movingBox.size.width);
					oldRect.origin.y = (oldRect.origin.y != movingBox.origin.y)?movingBox.origin.y:(movingBox.origin.y + movingBox.size.height);
					
					@synchronized (self)
					{
						if (!moving)
						{
							moving = TRUE;
							[UIView beginAnimations:nil context:NULL];
							[UIView setAnimationDuration:0.3];
							[UIView setAnimationDelegate:self];
							[UIView setAnimationDidStopSelector:@selector(animationDidStopAdd: finished: context:)];
							[touchesView setFrame:oldRect];
							[UIView commitAnimations];
							//[self PlaySound];
							[Girls instance].moveCount++;
							[gameScreen updateMoveLabel];					
						}
					}
				}			
			}
			
			
		}
		else 
		{
			if (isTouches)
			{
				CGRect newFrame = [touchesView frame];
				int x1 = [touchesView frame].origin.x - movingBox.origin.x;
				int y1 = [touchesView frame].origin.y - movingBox.origin.y;
				
				int x2 = (movingBox.origin.x + movingBox.size.width) - [touchesView frame].origin.x;
				int y2 = (movingBox.origin.y + movingBox.size.height) - [touchesView frame].origin.y;
				
				if ((x1*x1 + y1*y1) < (x2*x2 + y2*y2))
				{
					newFrame.origin.x = movingBox.origin.x;
					newFrame.origin.y = movingBox.origin.y;
				}
				else 
				{
					newFrame.origin.x = (movingBox.origin.x + movingBox.size.width);
					newFrame.origin.y = (movingBox.origin.y + movingBox.size.height);
				}
				if ((newFrame.origin.x != [touchesView frame].origin.x) || (newFrame.origin.y != [touchesView frame].origin.y) || !CGRectEqualToRect([touchesView frame], oldRectBox))
				{
					@synchronized (self)
					{
						if (!moving)
						{
							moving = TRUE;
							
							double fullPath = pow([touchesView frame].size.width, 2) + pow([touchesView frame].size.height, 2);
							fullPath = sqrt(fullPath);
							double currentPath = pow(([touchesView frame].origin.x - newFrame.origin.x), 2) + pow(([touchesView frame].origin.y - newFrame.origin.y), 2);
							currentPath = sqrt(currentPath);
							NSTimeInterval time = (currentPath / fullPath) * 0.5;
							time = (time <= 0.01)?(0.1):time;
							
							[UIView beginAnimations:nil context:NULL];
							[UIView setAnimationDuration:time];
							[UIView setAnimationDelegate:self];
							[UIView setAnimationDidStopSelector:@selector(animationDidStopAdd: finished: context:)];
							[touchesView setFrame:newFrame];
							[UIView commitAnimations];
						}
					}
					[Girls instance].moveCount++;
				}
				[gameScreen updateMoveLabel];
			}
		}
	}
	

	
	 
	isTouches = FALSE;
}

- (void)animationDidStopAdd:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
	@synchronized (self)
	{
		moving = FALSE;
		[self PlaySound];
	}
	if ([self isCompleted])
	{
		[gameScreen completeGame];
	}
	
}

- (void) dealloc
{
	[touchesView release];
	[gameScreen release];
	[super dealloc];
}


@end
