//
//  FindEmployeeViewController.m
//  CoreDataWithARC
//
//  Created by Daffodil Suncity on 12/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FindEmployeeViewController.h"
#import "AppDelegate.h"

@implementation FindEmployeeViewController
@synthesize employeeId;
@synthesize statusLabel;
@synthesize FoundResultLabel;

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
    self.title = @"Find Employee";
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([self.employeeId.text length]==0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Please enter Employee Id" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    else{
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Employee" 
                                                      inManagedObjectContext:context];
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        [request setEntity:entityDesc];
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"(employeeId = %@)", 
                             self.employeeId.text];
        [request setPredicate:pred];
        NSManagedObject *matches = nil;
        NSError *error;
        NSArray *objects = [context executeFetchRequest:request error:&error];
        
        if ([objects count] == 0) {
            statusLabel.text = @"No matches";
        } else {
            matches = [objects objectAtIndex:0];
                       self.FoundResultLabel.text = [NSString stringWithFormat:@"The Employee Name = %@ ,Phone No = %@ ", [matches valueForKey:@"employeeName"], [matches valueForKey:@"employeePhone"]];
            self.statusLabel.text = [NSString stringWithFormat:
                                @"%d matches found", [objects count]];
        }
        
    }
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidUnload
{
    [self setEmployeeId:nil];
    [self setStatusLabel:nil];
    [self setFoundResultLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
