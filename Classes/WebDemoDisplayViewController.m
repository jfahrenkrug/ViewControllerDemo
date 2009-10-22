//
//  WebDemoDisplayViewController.m
//  ViewControllerDemo
//
//  Created by Johannes Fahrenkrug on 22.10.09.
//  Copyright 2009 Springenwerk. All rights reserved.
//

#import "WebDemoDisplayViewController.h"
#import "WebDemo.h"


@implementation WebDemoDisplayViewController

- (id)initWithWebDemo:(WebDemo *)aWebDemo {
	if (!(self = [self initWithNibName:@"WebDemoDisplayView" bundle:nil]))
		return nil;
		
	if (!aWebDemo) {
		@throw [NSException exceptionWithName:@"WebDemoDisplayViewControllerBadInitCall" reason:@"webDemo is nil" userInfo:nil];
	}
	
	webDemo = [aWebDemo retain];
	
	return self;
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSString *path = [[NSBundle mainBundle] pathForResource:webDemo.fileName ofType:@"html"];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath: path]]];
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
