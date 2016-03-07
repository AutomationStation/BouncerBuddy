//
//  ViewController.h
//  project_feature_login
//
//  Created by Huge Face T-T on 2/7/16.
//  Copyright © 2016 494. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *UsernameField;

@property (strong, nonatomic) IBOutlet UITextField *PasswordField;

- (IBAction)LoginTapped:(UIButton *)sender;
- (IBAction)SignupTapped:(UIButton *)sender;



@end

