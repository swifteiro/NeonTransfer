//
//  User.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/18/16.
//  Copyright © 2016 Vinicius Minozzi All rights reserved.
//

import UIKit

class User {
    
    var name    = ""
    var email   = ""
    var token   = ""
    var picture = ""
    
    class var sharedInstance: User {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: User? = nil
        }
        dispatch_once(&Static.onceToken) { Static.instance = User() }
        return Static.instance!
    }
    
    func setUser(dictionary: [String : AnyObject]){
        // It's from mocked struct, so I'm sure that all properties are String
        User.sharedInstance.name = dictionary["name"] as! String
        User.sharedInstance.email = dictionary["email"] as! String
        User.sharedInstance.token = dictionary["token"] as! String
        User.sharedInstance.picture = dictionary["picture"] as! String
        NSUserDefaults.standardUserDefaults().setObject(dictionary, forKey: "user")
    }
    
    class func isFirstAccess() -> BooleanType {
        if let user = NSUserDefaults.standardUserDefaults().objectForKey("user") { if (user.count > 0) {return false} }
        return true
    }
    
    class func getTokenFromUserDefaults() -> String {
        if let dictUser = NSUserDefaults.standardUserDefaults().objectForKey("user") {
            return (dictUser.objectForKey("token") as? String)!
        }
        return ""
    }
}
