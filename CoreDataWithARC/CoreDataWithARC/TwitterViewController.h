//
//  TwitterViewController.h
//  Crown Decorating
//
//  Created by mac mini on 01/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullToRefreshViewController.h"
#import "TransformYourFigureService.h"

@interface TwitterViewController : PullToRefreshViewController
{
    NSString *NAVIGATION_BAR_TITLE;
    TransformYourFigureService *service;
    
    
    IBOutlet UITableViewCell *myCell;
    
    IBOutlet UILabel *dateLabel;
    IBOutlet UILabel *titleLabel;

}

@end
