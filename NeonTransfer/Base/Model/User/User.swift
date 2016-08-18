//
//  User.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/18/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit

class User {
    
    var name :String = ""
    var email :String = ""
    var token :String = ""
    var picture :String = ""
    
    class var sharedInstance: User {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: User? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = User()
        }
        return Static.instance!
    }
    
    func setUser(dictionary: [String : AnyObject]){
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
}
