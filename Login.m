//
//  Login.m
//  Blacklist1
//
//  Created by Huge Face T-T on 2/24/16.
//  Copyright © 2016 494. All rights reserved.
//

#import "Login.h"

@implementation Login
- (IBAction)LoginTapped:(UIButton *)sender {
    //A NSMutableDictionary store the information(for valid user) temporarily.
    NSMutableDictionary *infodictionary =[[NSMutableDictionary alloc] init];
    [infodictionary setObject:@"wenjli" forKey:@"rose"];
    [infodictionary setObject:@"2c" forKey:@"cathy"];
    [infodictionary setObject:@"3" forKey:@"corey"];
    
    // ID may changed to the reference of database.
    //If statement test the the username&password in dictionary(should be replaced by cloud/sqlite reference later)
    if ([self.PasswordField.text isEqualToString:[infodictionary objectForKey: self.UsernameField.text]]){
        //       Home *home = [[Home alloc] init];
        [self performSegueWithIdentifier:@"ToHome" sender:self];
    }
    //Show alter if Login failed
    else{
        // Add Alert with action
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Login Failed"
                                      message:@"Your Username or Passord is not valid."
                                      preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
        
        //Alert Actions-----declare the actions and then add to Alert.
        UIAlertAction* Cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 { [alert dismissViewControllerAnimated:YES completion:nil]; }];
        [alert addAction:Cancel];
        
    }
}
- (IBAction)SignupTapped:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"ToSignup" sender:self];
}
@end
