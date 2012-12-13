//
//  AddEmployeeViewController.m
//  CoreDataWithARC
//
//  Created by Daffodil Suncity on 12/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddEmployeeViewController.h"
#import "AppDelegate.h"
@implementation AddEmployeeViewController
@synthesize EmployeeId;
@synthesize EmployeeName;
@synthesize EmployeePhoneNo;
@synthesize statusLabel;
@synthesize managedObjectContext;
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
    self.title = @"Add Employee";
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(addAEmployee:)];
    self.navigationItem.rightBarButtonItem = addButton;
}
-(IBAction)addAEmployee:(id)sender
{
    if([self.EmployeeId.text length] ==0)
    { 
        [self.EmployeeId resignFirstResponder];
        [self showAlert:@"" Message:@"Please enter Employee Id"];
    }
    else if([self.EmployeeName.text length] ==0)
    {
        [self.EmployeeName resignFirstResponder];
        [self showAlert:@"" Message:@"Please enter Employee name"];
    }
    else if([self.EmployeePhoneNo.text length] ==0)
    {
        [self.EmployeePhoneNo resignFirstResponder];
        [self showAlert:@"" Message:@"Please enter Employee Phone Number"];
    }
    else{
        [self.EmployeeId resignFirstResponder];
        [self.EmployeeName resignFirstResponder];
        [self.EmployeePhoneNo resignFirstResponder];
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        NSManagedObject *newContact;
        newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
        [newContact setValue:self.EmployeeId.text forKey:@"employeeId"];
        [newContact setValue:self.EmployeeName.text forKey:@"employeeName"];
        [newContact setValue:self.EmployeePhoneNo.text forKey:@"employeePhone"];
        self.EmployeeId.text = @"";
        self.EmployeeName.text = @"";
        self.EmployeePhoneNo.text = @"";
        NSError *error;
        [context save:&error];
        statusLabel.text = @"Contact saved";
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void) showAlert :(NSString*)title Message:(NSString*)msg
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}
- (void)viewDidUnload
{
    [self setEmployeeId:nil];
    [self setEmployeeName:nil];
    [self setEmployeePhoneNo:nil];
    [self setStatusLabel:nil];
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
