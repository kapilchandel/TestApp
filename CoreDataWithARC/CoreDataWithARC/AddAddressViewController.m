//
//  AddAddressViewController.m
//  CoreDataWithARC
//
//  Created by Daffodil Suncity on 12/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddAddressViewController.h"
#import "AppDelegate.h"
@implementation AddAddressViewController
@synthesize employeeId;
@synthesize employeeAddress;
@synthesize statusLabel;

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



#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.statusLabel.text = @"Add Employee";
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(addAEmployee:)];
    self.navigationItem.rightBarButtonItem = addButton;
}
-(IBAction)addAEmployee:(id)sender
{
    if([self.employeeId.text length] ==0)
    { 
        [self.employeeId resignFirstResponder];
        [self showAlert:@"" Message:@"Please enter Employee Id"];
    }
    else if([self.employeeAddress.text length] ==0)
    {
        [self.employeeAddress resignFirstResponder];
        [self showAlert:@"" Message:@"Please enter Employee name"];
    }
    
    else{
        [self.employeeId resignFirstResponder];
        [self.employeeAddress resignFirstResponder];
      
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        NSManagedObject *newContact;
        newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Address" inManagedObjectContext:context];
        [newContact setValue:self.employeeId.text forKey:@"employeeId"];
        [newContact setValue:self.employeeAddress.text forKey:@"employeeAddress"];
      
        self.employeeId.text = @"";
        self.employeeAddress.text = @"";
        NSError *error;
        [context save:&error];
        statusLabel.text = @"Address saved";
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
    [self setEmployeeAddress:nil];
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
