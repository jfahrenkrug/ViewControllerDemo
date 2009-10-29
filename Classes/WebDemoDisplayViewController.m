//
//  WebDemoDisplayViewController.m
//  ViewControllerDemo
//
//  Created by Johannes Fahrenkrug on 22.10.09.
//  Copyright 2009 Springenwerk. All rights reserved.
//

#import "WebDemoDisplayViewController.h"
#import "WebDemoSourceViewController.h"
#import "WebDemo.h"


@implementation WebDemoDisplayViewController

- (id)initWithWebDemo:(WebDemo *)aWebDemo {
	if (!(self = [self initWithNibName:@"WebDemoDisplayView" bundle:nil]))
		return nil;
		
	if (!aWebDemo) {
		@throw [NSException exceptionWithName:@"WebDemoDisplayViewControllerBadInitCall" reason:@"webDemo is nil" userInfo:nil];
	}
	
	webDemo = [aWebDemo retain];
	
	self.title = webDemo.name;
	
	return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSString *path = [[NSBundle mainBundle] pathForResource:webDemo.fileName ofType:@"html"];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath: path]]];
	
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
																							target:self action:@selector(showSource)] autorelease];
	
	
}

- (void)showSource {
	WebDemoSourceViewController *sourceController = [[WebDemoSourceViewController alloc] initWithWebDemo:webDemo];
	UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:sourceController];
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	
	sourceController.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply
																								  target:sourceController action:@selector(dismissModalViewControllerAnimated:)] autorelease];
	
	[self presentModalViewController: controller animated: YES];
	
	
	[controller release];
	[sourceController release];
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
}

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
