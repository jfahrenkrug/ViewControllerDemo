//
//  WebDemo.h
//  ViewControllerDemo
//
//  Created by Johannes Fahrenkrug on 20.10.09.
//  Copyright 2009 Springenwerk. All rights reserved.
//

#import <Foundation/Foundation.h>

#define WEB_DEMO_CANVAS 0
#define WEB_DEMO_CSS 1

@interface WebDemo : NSObject {
	NSString *name;
	NSString *fileName;
	int type;
}

@property (readwrite, copy) NSString *name;
@property (readwrite, copy) NSString *fileName;
@property (assign) int type;


+ (WebDemo *)webDemoWithType:(int)aType name:(NSString *)aName fileName:(NSString *)aFileName;

- (id)initWithType:(int)aType name:(NSString *)aName fileName:(NSString *)aFileName;
- (NSString *)imageFileName;

@end
