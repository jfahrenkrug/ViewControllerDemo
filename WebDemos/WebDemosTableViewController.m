//
//  WebDemosTableViewController.m
//  WebDemos
//
//  Created by Johannes Fahrenkrug on 17.04.12.
//  Copyright (c) 2012 Springenwerk. All rights reserved.
//

#import "WebDemosTableViewController.h"
#import "DataController.h"
#import "WebDemo.h"
#import "WebDemosDisplayViewController.h"
#import "WebDemoSourceViewController.h"

@interface WebDemosTableViewController ()

@end

@implementation WebDemosTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    if (!(self = [super initWithStyle:style]))
        return nil;
    
    self.title = @"Deluxe";
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.rowHeight = 100;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  	if (section == 0) {
		return [[DataController sharedInstance] numberOfCssWebDemos];
	} else {
		return [[DataController sharedInstance] numberOfCanvasWebDemos];
	}
}

- (WebDemo *)webDemoForIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == 0) {
		return [[DataController sharedInstance] cssWebDemoAtIndex:indexPath.row];
	} else {
		return [[DataController sharedInstance] canvasWebDemoAtIndex:indexPath.row];
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    WebDemo *webDemo = [self webDemoForIndexPath:indexPath];

    if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;	
    }
    
    cell.textLabel.text = webDemo.name;
    cell.detailTextLabel.text = webDemo.description;
    cell.imageView.image = [UIImage imageNamed:webDemo.imageFileName];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if (section == 0) {
		return @"CSS Transformations";
	} else {
		return @"Canvas";
	}
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WebDemo *webDemo = [self webDemoForIndexPath:indexPath];
	NSLog(@"Ausgewaehlt: %@", webDemo.name);
    
    WebDemosDisplayViewController *dispVC  = [[WebDemosDisplayViewController alloc] initWithWebDemo:webDemo];
    
    [self.navigationController pushViewController:dispVC animated:YES];
                                              
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    WebDemo *webDemo = [self webDemoForIndexPath:indexPath];
    
    WebDemoSourceViewController *dispVC  = [[WebDemoSourceViewController alloc] initWithWebDemo:webDemo];
    
    [self.navigationController pushViewController:dispVC animated:YES];
}

@end
