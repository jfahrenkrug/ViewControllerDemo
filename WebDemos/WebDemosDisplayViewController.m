//
//  WebDemosDisplayViewController.m
//  WebDemos
//
//  Created by Johannes Fahrenkrug on 17.04.12.
//  Copyright (c) 2012 Springenwerk. All rights reserved.
//

#import "WebDemosDisplayViewController.h"
#import "WebDemoSourceViewController.h"

@interface WebDemosDisplayViewController ()

@end

@implementation WebDemosDisplayViewController
@synthesize webView = _webView;
@synthesize webDemo=_webDemo;

- (id)initWithWebDemo:(WebDemo *)aWebDemo {
	if (!(self = [self initWithNibName:@"WebDemosDisplayViewController" bundle:nil]))
		return nil;
    
	if (!aWebDemo) {
		@throw [NSException exceptionWithName:@"WebDemoDisplayViewControllerBadInitCall" reason:@"webDemo is nil" userInfo:nil];
	}
	
	_webDemo = aWebDemo;
	
	self.title = _webDemo.name;
	
	return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:_webDemo.fileName ofType:@"html"];
    
    
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath: path]]];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(showSource)];
}

- (void)showSource {
    WebDemoSourceViewController *sourceController = [[WebDemoSourceViewController alloc] initWithWebDemo:_webDemo];
    UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:sourceController];
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    sourceController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply
                                                                                                       target:sourceController action:@selector(dismissModalViewControllerAnimated:)];
    
    [self presentModalViewController: controller animated: YES];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
