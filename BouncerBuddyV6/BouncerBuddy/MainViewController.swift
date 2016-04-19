//
//  ViewController.swift
//  BouncerBuddy
//
//  Created by Sha Wu on 16/3/2.
//  Copyright © 2016年 Sheryl Hong. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
        
        // comment out the next lines if you want to go to homepage without sign in
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
        if (isLoggedIn != 1){
            self.performSegueWithIdentifier("SignInView", sender: self)
        }else{
            self.usernameLabel.text = prefs.valueForKey("USERNAME") as? String
            
        }
    
        
    }

    @IBAction func LogoutTapped(sender: AnyObject) {
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        
        self.performSegueWithIdentifier("SignInView", sender: self)
    }

}

