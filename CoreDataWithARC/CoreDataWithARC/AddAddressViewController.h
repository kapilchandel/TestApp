//
//  AddAddressViewController.h
//  CoreDataWithARC
//
//  Created by Daffodil Suncity on 12/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddAddressViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *employeeId;
@property (weak, nonatomic) IBOutlet UITextField *employeeAddress;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
-(void) showAlert :(NSString*)title Message:(NSString*)msg;
@end
