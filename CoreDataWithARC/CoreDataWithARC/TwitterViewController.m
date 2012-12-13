//
//  TwitterViewController.m
//  Crown Decorating
//
//  Created by mac mini on 01/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TwitterViewController.h"
#import "TwitterDetailViewController.h"
#import "Response.h"

@implementation TwitterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NAVIGATION_BAR_TITLE = @"Twitter";
              

    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [super addContactButtonOnNavigationBar];
    [super showLoadingView];
  

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title = NAVIGATION_BAR_TITLE;
    
  
    
    [self performSelectorInBackground:@selector(threadWorkTwitterFeed:) withObject:nil];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
     return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Thread Social Feed

- (IBAction)threadWorkTwitterFeed:(id)sender{
    
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    assert(pool != nil);
    
    service = [[TransformYourFigureService alloc]init];
    
    pullToRefreshTableDataArray = [[NSMutableArray alloc]initWithArray:[service getTweets]];
    
    
    
    [self performSelectorOnMainThread:@selector(stopSpinnerTwitterFeed:)withObject:nil waitUntilDone:NO];
    
    [pool drain];
    
}

- (IBAction)stopSpinnerTwitterFeed:(id)sender{
    [super hideLoadingView];
    
    if ([pullToRefreshTableDataArray count] > 0) {
        
        [pullToRefreshTableView reloadData];
        
    } 
    else {
        
        [super showAlert:@"Feed not available!"];
    }
    
    
}

-(void)updateTableDataArray
{
    
    pullToRefreshTableDataArray =  [[NSMutableArray alloc ]initWithArray :[service getTweets]];    
    
}


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%d",[pullToRefreshTableDataArray count]);
    return [pullToRefreshTableDataArray count];
}

- (CGFloat) tableView: (UITableView *) tableView heightForRowAtIndexPath: (NSIndexPath *) indexPath
{
    
    return 120;   
    
    
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        
        [[NSBundle mainBundle] loadNibNamed:@"TwitterCell" owner:self options:nil];
        cell = myCell;
        
        
    }
    //Get screen width/height
    CGRect cgRect =[[UIScreen mainScreen] bounds];
    CGSize cgSize = cgRect.size;
    
    UIView *bgColor = [cell viewWithTag:100];
    if (!bgColor) {
        CGRect frame = CGRectMake(0, 0, cgSize.width, 80);
        bgColor = [[UIView alloc] initWithFrame:frame];
        bgColor.tag = 100; //tag id to access the view later
        [cell addSubview:bgColor];
        [cell sendSubviewToBack:bgColor];
        [bgColor release];
    }
    
    
    dateLabel.text = [[(Response *)[pullToRefreshTableDataArray objectAtIndex:indexPath.row] date] substringToIndex:26];
    if ([[(Response *)[pullToRefreshTableDataArray objectAtIndex:indexPath.row] title] length]>18){
        
        titleLabel.text = [[(Response *)[pullToRefreshTableDataArray objectAtIndex:indexPath.row] title] substringFromIndex:17];
        
    }
    else
    {
        
        titleLabel.text = [(Response *)[pullToRefreshTableDataArray objectAtIndex:indexPath.row] title];
        
    }    return cell;
}




#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	NSLog(@"Row Selected!!!");
    
    TwitterDetailViewController *controller = [[TwitterDetailViewController alloc] initWithNibName:@"TwitterDetailViewController" bundle:nil];
    
    controller.date =[[(Response *)[pullToRefreshTableDataArray objectAtIndex:indexPath.row] date] substringToIndex:26];
    
    if ([[(Response *)[pullToRefreshTableDataArray objectAtIndex:indexPath.row] title] length]>18){
        
        controller.tweet = [[(Response *)[pullToRefreshTableDataArray objectAtIndex:indexPath.row] title] substringFromIndex:17];
        
    }
    else
    {
        
        controller.tweet = [(Response *)[pullToRefreshTableDataArray objectAtIndex:indexPath.row] title];
        
    }

    
    [self.navigationController pushViewController:controller animated:YES];
    
    
    
    
}

@end
