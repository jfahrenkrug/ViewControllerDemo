//
//  WebDemo.m
//  ViewControllerDemo
//
//  Created by Johannes Fahrenkrug on 20.10.09.
//  Copyright 2009 Springenwerk. All rights reserved.
//

#import "WebDemo.h"


@implementation WebDemo

@synthesize name, fileName, imageFileName, type;

+ (WebDemo *)webDemoWithType:(int)aType name:(NSString *)aName fileName:(NSString *)aFileName {
	return [[[WebDemo alloc] initWithType:aType name:aName fileName:aFileName] autorelease];
}

- (id)init {
	return [self initWithType:-1 name:nil fileName:nil];
}

- (id)initWithType:(int)aType name:(NSString *)aName fileName:(NSString *)aFileName {
	if (!(self = [super init]))
		return nil;
	
	if (!aName || !aFileName) {
		@throw [NSException exceptionWithName:@"WebDemoBadInitCall" reason:@"name or fileName is nil" userInfo:nil];
	}
	
	if (aType != WEB_DEMO_CANVAS && aType != WEB_DEMO_CSS) {
		@throw [NSException exceptionWithName:@"WebDemoBadInitCall" reason:@"type neither canvas nor css" userInfo:nil];
	}
	
	self.name = aName;
	self.fileName = aFileName;
	self.imageFileName = [NSString stringWithFormat:@"%@.png", aFileName];
	
	return self;
}


@end
