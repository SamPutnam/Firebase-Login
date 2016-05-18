//
//  InitialSegueController.swift
//  Homesafe
//
//  Created by Samuel Putnam on 5/18/16.
//  Copyright © 2016 Sam Putnam. All rights reserved.
//

import Foundation
import UIKit

class InitialSegueController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
      
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        if LoginViewController.LoggedIn.LoggedInUsingFirebase == true || LoginViewController.LoggedIn.LoggedInUsingFacebook == true {
            self.performSegueWithIdentifier("LoggedIn", sender: self)
            print(LoginViewController.LoggedIn.LoggedInUsingFirebase)
            print(LoginViewController.LoggedIn.LoggedInUsingFacebook)
        }
        else {
            self.performSegueWithIdentifier("NotLoggedIn", sender: self)
            print(LoginViewController.LoggedIn.LoggedInUsingFirebase)
            print(LoginViewController.LoggedIn.LoggedInUsingFacebook)
        }

        var activityView = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        
        activityView.center = self.view.center
        
        activityView.startAnimating()
        
        self.view.addSubview(activityView)
        
    }

    @IBOutlet weak var Activity: UIActivityIndicatorView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
