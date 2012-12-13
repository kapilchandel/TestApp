//
//  AddEmployeeViewController.h
//  CoreDataWithARC
//
//  Created by Daffodil Suncity on 12/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEmployeeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *EmployeeId;
@property (weak, nonatomic) IBOutlet UITextField *EmployeeName;
@property (weak, nonatomic) IBOutlet UITextField *EmployeePhoneNo;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
-(void) showAlert :(NSString*)title Message:(NSString*)msg;
@end
