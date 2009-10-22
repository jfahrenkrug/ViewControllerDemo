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

@synthesize canvasWebDemos, cssWebDemos;

+ (DataController *) sharedInstance {
	if (gSharedInstance == nil) {
		gSharedInstance = [[DataController alloc] init];
	}
	
	return [[gSharedInstance retain] autorelease];
}

- (id)init {	
	if (!(self = [super init]))
		return nil;
	
	canvasWebDemos = [[NSMutableArray alloc] init];
	cssWebDemos = [[NSMutableArray alloc] init];
	
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
	return [[self cssWebDemos] arrayByAddingObjectsFromArray:[self canvasWebDemos]];
}

- (void) addWebDemo:(WebDemo *)aWebDemo {
	if (aWebDemo != nil) {
		switch (aWebDemo.type) {
			case WEB_DEMO_CANVAS:
				[canvasWebDemos addObject:aWebDemo];
				break;
			case WEB_DEMO_CSS:
				[cssWebDemos addObject:aWebDemo];
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
			return [cssWebDemos objectAtIndex:anIndex];
		} else {
			anIndex = anIndex - [self numberOfCssWebDemos];
			return [canvasWebDemos objectAtIndex:anIndex];
		}
	}
	
	return nil;
}

- (void)removeWebDemoAtIndex:(int)anIndex {
	if (!(anIndex < 0 || anIndex > ([self numberOfWebDemos] - 1))) {
		if (anIndex < [self numberOfCssWebDemos]) {
			[cssWebDemos removeObjectAtIndex:anIndex];
		} else {
			anIndex = anIndex - [self numberOfCssWebDemos];
			[canvasWebDemos removeObjectAtIndex:anIndex];
		}
	}
}

#pragma mark Canvas Web Demos
- (int) numberOfCanvasWebDemos {
	if (canvasWebDemos == nil) {
		return 0;
	}
	return [canvasWebDemos count];
}


- (WebDemo *)canvasWebDemoAtIndex:(int)anIndex {
	if (!(anIndex < 0 || anIndex > ([canvasWebDemos count] - 1))) {
		return [canvasWebDemos objectAtIndex:anIndex];
	}
	
	return nil;
}

- (void)removeCanvasWebDemoAtIndex:(int)anIndex {
	[canvasWebDemos removeObjectAtIndex:anIndex];
}


#pragma mark CSS Web Demos
- (int) numberOfCssWebDemos {
	if (cssWebDemos == nil) {
		return 0;
	}
	return [cssWebDemos count];
}


- (WebDemo *)cssWebDemoAtIndex:(int)anIndex {
	if (!(anIndex < 0 || anIndex > ([cssWebDemos count] - 1))) {
		return [cssWebDemos objectAtIndex:anIndex];
	}
	
	return nil;
}

- (void)removeCssWebDemoAtIndex:(int)anIndex {
	[cssWebDemos removeObjectAtIndex:anIndex];
}


- (void)dealloc {
	[cssWebDemos release];
	[canvasWebDemos release];

	[super dealloc];
}

@end
