//
//  WebDemosTableViewController.m
//  ViewControllerDemo
//
//  Created by Johannes Fahrenkrug on 20.10.09.
//  Copyright 2009 Springenwerk. All rights reserved.
//

#import "WebDemosTableViewController.h"
#import "DataController.h"
#import "WebDemo.h"
#import "WebDemoDisplayViewController.h"
#import "WebDemoSourceViewController.h"

@interface WebDemosTableViewController(PrivateMethods)
- (WebDemo *)webDemoForIndexPath:(NSIndexPath *)indexPath;
@end


@implementation WebDemosTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.tableView.rowHeight = 100;
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/


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


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if (section == 0) {
		return @"CSS Transformations";
	} else {
		return @"Canvas";
	}
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (section == 0) {
		return [[DataController sharedInstance] numberOfCssWebDemos];
	} else {
		return [[DataController sharedInstance] numberOfCanvasWebDemos];
	}
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *CellIdentifier = @"Cell";
	
	WebDemo *webDemo = [self webDemoForIndexPath:indexPath];
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	}
    
	// Configure the cell.
	
	cell.textLabel.text = webDemo.name;
	cell.detailTextLabel.text = [webDemo description];
	cell.imageView.image = [UIImage imageNamed:webDemo.imageFileName];
	
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	WebDemo *webDemo = [self webDemoForIndexPath:indexPath];
	NSLog(@"Ausgewaehlt: %@", webDemo.name);

	WebDemoDisplayViewController *displayViewController = [[WebDemoDisplayViewController alloc] initWithWebDemo:webDemo];
	[self.navigationController pushViewController:displayViewController animated:YES];
	[displayViewController release];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	WebDemo *webDemo = [self webDemoForIndexPath:indexPath];
	
	WebDemoSourceViewController *sourceViewController = [[WebDemoSourceViewController alloc] initWithWebDemo:webDemo];
	[self.navigationController pushViewController:sourceViewController animated:YES];
	[sourceViewController release];
}

- (WebDemo *)webDemoForIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == 0) {
		return [[DataController sharedInstance] cssWebDemoAtIndex:indexPath.row];
	} else {
		return [[DataController sharedInstance] canvasWebDemoAtIndex:indexPath.row];
	}
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)dealloc {
    [super dealloc];
}


@end

