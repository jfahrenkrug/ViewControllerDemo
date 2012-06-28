//
//  WebDemosSimpleTableViewController.m
//  ViewControllerDemo
//
//  Created by Johannes Fahrenkrug on 28.10.09.
//  Copyright 2009 Springenwerk. All rights reserved.
//

#import "WebDemosSimpleTableViewController.h"
#import "WebDemo.h"
#import "DataController.h"
#import "WebDemosDisplayViewController.h"


@implementation WebDemosSimpleTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    if (!(self = [super initWithStyle:style]))
        return nil;
    
    self.title = @"Simple";
        
    return self;
}


// Override to allow orientations other than the default portrait orientation.

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
}
 

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [[DataController sharedInstance] numberOfWebDemos];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *CellIdentifier = @"Cell";
	WebDemo *webDemo = [[DataController sharedInstance] webDemoAtIndex:indexPath.row];
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
    
	// Configure the cell.	
	cell.textLabel.text = webDemo.name;
	
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	WebDemo *webDemo = [[DataController sharedInstance] webDemoAtIndex:indexPath.row];
	
	
	WebDemosDisplayViewController *displayViewController = [[WebDemosDisplayViewController alloc] initWithWebDemo:webDemo];
	[self.navigationController pushViewController:displayViewController animated:YES];

}




@end

