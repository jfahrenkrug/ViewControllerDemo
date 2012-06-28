//
//  DataController.m
//  ViewControllerDemo
//
//  Created by Johannes Fahrenkrug on 20.10.09.
//  Copyright 2009 Springenwerk. All rights reserved.
//

#import "DataController.h"
#import "WebDemo.h"


@implementation DataController

static DataController *gSharedInstance = nil;

@synthesize canvasWebDemos=_canvasWebDemos, cssWebDemos=_cssWebDemos;

+ (DataController *) sharedInstance {
	if (gSharedInstance == nil) {
		gSharedInstance = [[DataController alloc] init];
	}
	
	return gSharedInstance;
}

- (id)init {	
	if (!(self = [super init]))
		return nil;
	
	_canvasWebDemos = [[NSMutableArray alloc] init];
	_cssWebDemos = [[NSMutableArray alloc] init];
	
	// set up the demo data
	NSArray *canvases = [NSArray arrayWithObjects:@"Beauty", @"Boxes", @"Simple Geometry", @"Starfield", @"Circle Pattern", nil];
	
	for (int i = 0; i < [canvases count]; i++) {
		[self addWebDemo:[WebDemo webDemoWithType:WEB_DEMO_CANVAS name:[canvases objectAtIndex:i] fileName:[NSString stringWithFormat:@"canvas%i", i + 1]]];
	}
						 
	NSArray *csses = [NSArray arrayWithObjects:@"Falling Leaves", @"Spinning Cylinder", @"Card Flip", @"Simple 3D", @"3D iFrame", nil];
	
	for (int i = 0; i < [csses count]; i++) {
		[self addWebDemo:[WebDemo webDemoWithType:WEB_DEMO_CSS name:[csses objectAtIndex:i] fileName:[NSString stringWithFormat:@"css%i", i + 1]]];
	}
	
	return self;
}

#pragma mark All Web Demos
- (NSArray *)webDemos {
	return [_cssWebDemos arrayByAddingObjectsFromArray:_canvasWebDemos];
}

- (void) addWebDemo:(WebDemo *)aWebDemo {
	if (aWebDemo != nil) {
		switch (aWebDemo.type) {
			case WEB_DEMO_CANVAS:
				[_canvasWebDemos addObject:aWebDemo];
				break;
			case WEB_DEMO_CSS:
				[_cssWebDemos addObject:aWebDemo];
				break;
		}
	}
}

- (int) numberOfWebDemos {
	return [self numberOfCssWebDemos] + [self numberOfCanvasWebDemos];
}


- (WebDemo *)webDemoAtIndex:(int)anIndex {
	if (!(anIndex < 0 || anIndex > ([self numberOfWebDemos] - 1))) {
		if (anIndex < [self numberOfCssWebDemos]) {
			return [_cssWebDemos objectAtIndex:anIndex];
		} else {
			anIndex = anIndex - [self numberOfCssWebDemos];
			return [_canvasWebDemos objectAtIndex:anIndex];
		}
	}
	
	return nil;
}

- (void)removeWebDemoAtIndex:(int)anIndex {
	if (!(anIndex < 0 || anIndex > ([self numberOfWebDemos] - 1))) {
		if (anIndex < [self numberOfCssWebDemos]) {
			[_cssWebDemos removeObjectAtIndex:anIndex];
		} else {
			anIndex = anIndex - [self numberOfCssWebDemos];
			[_canvasWebDemos removeObjectAtIndex:anIndex];
		}
	}
}

#pragma mark Canvas Web Demos
- (int) numberOfCanvasWebDemos {
	if (_canvasWebDemos == nil) {
		return 0;
	}
	return [_canvasWebDemos count];
}


- (WebDemo *)canvasWebDemoAtIndex:(int)anIndex {
	if (!(anIndex < 0 || anIndex > ([_canvasWebDemos count] - 1))) {
		return [_canvasWebDemos objectAtIndex:anIndex];
	}
	
	return nil;
}

- (void)removeCanvasWebDemoAtIndex:(int)anIndex {
	[_canvasWebDemos removeObjectAtIndex:anIndex];
}


#pragma mark CSS Web Demos
- (int) numberOfCssWebDemos {
	if (_cssWebDemos == nil) {
		return 0;
	}
	return [_cssWebDemos count];
}


- (WebDemo *)cssWebDemoAtIndex:(int)anIndex {
	if (!(anIndex < 0 || anIndex > ([_cssWebDemos count] - 1))) {
		return [_cssWebDemos objectAtIndex:anIndex];
	}
	
	return nil;
}

- (void)removeCssWebDemoAtIndex:(int)anIndex {
	[_cssWebDemos removeObjectAtIndex:anIndex];
}



@end
