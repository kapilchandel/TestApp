//
//  CoreDataViewController.m
//  CoreDataWithARC
//
//  Created by Daffodil Suncity on 12/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CoreDataViewController.h"
#import "AddEmployeeViewController.h"
#import "FindEmployeeViewController.h"
#import "AddAddressViewController.h"
@implementation CoreDataViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)addEmployeeButtonClicked:(id)sender {
    AddEmployeeViewController *add=[[AddEmployeeViewController alloc]initWithNibName:@"AddEmployeeViewController" bundle:nil];
    [self.navigationController pushViewController:add animated:YES];
    
}

- (IBAction)findEmployeeButtonClicked:(id)sender {
    FindEmployeeViewController *find=[[FindEmployeeViewController alloc]initWithNibName:@"FindEmployeeViewController" bundle:nil];
    [self.navigationController pushViewController:find animated:YES];
}

- (IBAction)addAddressButton:(id)sender 
{
    AddAddressViewController *address=[[AddAddressViewController alloc]initWithNibName:@"AddAddressViewController" bundle:nil];
    [self.navigationController pushViewController:address animated:YES];
    
}
@end
