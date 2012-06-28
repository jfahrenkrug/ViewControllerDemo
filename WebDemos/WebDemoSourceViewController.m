//
//  WebDemoSourceViewController.m
//  ViewControllerDemo
//
//  Created by Johannes Fahrenkrug on 28.10.09.
//  Copyright 2009 Springenwerk. All rights reserved.
//

#import "WebDemoSourceViewController.h"
#import "WebDemo.h"


@implementation WebDemoSourceViewController
@synthesize webDemo=_webDemo, textView=_textView;

- (id)initWithWebDemo:(WebDemo *)aWebDemo {
	if (!(self = [self initWithNibName:@"WebDemoSourceView" bundle:nil]))
		return nil;
	
	if (!aWebDemo) {
		@throw [NSException exceptionWithName:@"WebDemoSourceViewControllerBadInitCall" reason:@"webDemo is nil" userInfo:nil];
	}
	
	_webDemo = aWebDemo;
	
	self.title = _webDemo.name;
	
	return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSString *path = [[NSBundle mainBundle] pathForResource:_webDemo.fileName ofType:@"html"];
	_textView.text = [NSString stringWithContentsOfURL:[NSURL fileURLWithPath: path] encoding:NSUTF8StringEncoding error:nil];
}


// Override to allow orientations other than the default portrait orientation.

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
}

@end
