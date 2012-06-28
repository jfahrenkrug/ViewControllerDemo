//
//  WebDemosDisplayViewController.h
//  WebDemos
//
//  Created by Johannes Fahrenkrug on 17.04.12.
//  Copyright (c) 2012 Springenwerk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebDemo.h"

@interface WebDemosDisplayViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic, strong) WebDemo *webDemo;

- (id)initWithWebDemo:(WebDemo *)aWebDemo;


@end
