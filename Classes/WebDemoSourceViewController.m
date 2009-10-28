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

- (id)initWithWebDemo:(WebDemo *)aWebDemo {
	if (!(self = [self initWithNibName:@"WebDemoSourceView" bundle:nil]))
		return nil;
	
	if (!aWebDemo) {
		@throw [NSException exceptionWithName:@"WebDemoSourceViewControllerBadInitCall" reason:@"webDemo is nil" userInfo:nil];
	}
	
	webDemo = [aWebDemo retain];
	
	self.title = webDemo.name;
	
	return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSString *path = [[NSBundle mainBundle] pathForResource:webDemo.fileName ofType:@"html"];
	textView.text = [NSString stringWithContentsOfURL:[NSURL fileURLWithPath: path] encoding:NSUTF8StringEncoding error:nil];
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[webDemo release];
    [super dealloc];
}


@end
