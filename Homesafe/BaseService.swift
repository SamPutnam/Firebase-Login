//
//  BaseService.swift
//  Homesafe
//
//  Created by Samuel Putnam on 5/6/16.
//  Copyright © 2016 Sam Putnam. All rights reserved.
//

import Foundation
import Firebase

let BASE_URL = "https://homesafeapp.firebaseio.com"

let FIREBASE_REF = Firebase(url: BASE_URL)

var CURRENT_USER: Firebase
{
    let userID = NSUserDefaults.standardUserDefaults().valueForKey("uid") as! String
    //ask to get Firebase current user from database
    let currentUser = Firebase(url: "\(FIREBASE_REF)").childByAppendingPath("users").childByAppendingPath(userID)
    
    return currentUser!
}
