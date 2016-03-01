//
//  TableViewController.h
//  Blacklist1
//
//  Created by Huge Face T-T on 2/24/16.
//  Copyright © 2016 494. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray *Black_users;
- (IBAction)AddtoBlacklist:(UIBarButtonItem *)sender;
- (IBAction)Search:(id)sender;
@end
