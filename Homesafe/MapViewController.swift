//
//  ViewController.swift
//  Homesafe
//
//  Created by Samuel Putnam on 5/17/16.
//  Copyright © 2016 Sam Putnam. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        @IBAction func appLogoutAction(sender: AnyObject) {
            
            
            //unauthenticate our user from our Firebase instance
            CURRENT_USER.unauth()
            //set the uid we previously used to authorize the user to nil, because there's no longer a user logged in.
            NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "uid")
            self.dismissViewControllerAnimated(true, completion: nil)

            
        }
    }
