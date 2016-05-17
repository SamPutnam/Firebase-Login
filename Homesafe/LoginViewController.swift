//
//  LoginViewController.swift
//  Homesafe
//
//  Created by Samuel Putnam on 5/6/16.
//  Copyright © 2016 Sam Putnam. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }

    
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        
        if NSUserDefaults.standardUserDefaults().valueForKey("uid") != nil && CURRENT_USER.authData != nil
        {
            self.logoutButton.hidden = false
            
        }
        else {
            self.logoutButton.hidden = true
        }
        
    }
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
    @IBAction func loginAction(sender: AnyObject) {
        // get information upon touch
        let email = self.emailTextField.text
        let password = self.passwordTextField.text
        
        if email != "" && password != ""
        {   //call authUser method to authenticate the user which returns an error and authData object
            
            FIREBASE_REF.authUser(email, password: password, withCompletionBlock: { (error, authData) -> Void in
                
                if error == nil
                {   //save users unique identifier in our NSUSerDefaults
                    NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "uid")
                    print("Logged In")
                    //set logout button hidden to false, so that it is visible and user could log out
                    self.logoutButton.hidden = false
                    print("here")
                    self.performSegueWithIdentifier("showNew", sender: self)
                }
                else
                {
                    print("there is an error")
                    print(error)
                    let alert = UIAlertController(title: "Error", message: "Enter Email and Password",  preferredStyle: .Alert)
                    
                    let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    
                    alert.addAction(action)
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            })
        
        }
        else
        {
            let alert = UIAlertController(title: "Error", message: "Enter Email and Password",  preferredStyle: .Alert)
            
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alert.addAction(action)
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    @IBAction func logoutAction(sender: AnyObject) {
        //unauthenticate our user from our Firebase instance
        CURRENT_USER.unauth()
        //set the uid we previously used to authorize the user to nil, because there's no longer a user logged in.
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "uid")
        //user is logged out, so we don't need the logout button, we can hide it.
        self.logoutButton.hidden = true
        
        
    }
}
