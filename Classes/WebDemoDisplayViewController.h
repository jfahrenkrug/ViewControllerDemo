//
//  WebDemoDisplayViewController.h
//  ViewControllerDemo
//
//  Created by Johannes Fahrenkrug on 22.10.09.
//  Copyright 2009 Springenwerk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebDemo;

@interface WebDemoDisplayViewController : UIViewController {
	WebDemo *webDemo;
	IBOutlet UIWebView *webView;
}

- (id)initWithWebDemo:(WebDemo *)aWebDemo;

@end
