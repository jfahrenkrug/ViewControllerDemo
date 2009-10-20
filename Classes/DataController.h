//
//  DataController.h
//  ViewControllerDemo
//
//  Created by Johannes Fahrenkrug on 20.10.09.
//  Copyright 2009 Springenwerk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WebDemo;

@interface DataController : NSObject {
	NSMutableArray *canvasWebDemos;
	NSMutableArray *cssWebDemos;
}

@property (nonatomic, retain, readwrite) NSMutableArray *canvasWebDemos;
@property (nonatomic, retain, readwrite) NSMutableArray *cssWebDemos;

+ (DataController *) sharedInstance;

// all web demos
- (NSArray *)webDemos;
- (void) addWebDemo:(WebDemo *)aWebDemo;
- (int) numberOfWebDemos;
- (WebDemo *)webDemoAtIndex:(int)anIndex;
- (void)removeWebDemoAtIndex:(int)anIndex;

// canvas
- (int) numberOfCanvasWebDemos;
- (WebDemo *)canvasWebDemoAtIndex:(int)anIndex;
- (void)removeCanvasWebDemoAtIndex:(int)anIndex;

// css
- (int) numberOfCssWebDemos;
- (WebDemo *)cssWebDemoAtIndex:(int)anIndex;
- (void)removeCssWebDemoAtIndex:(int)anIndex;

@end
