//
//  Contact.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/17/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit

import JSONHelper

class Contact: Deserializable {
    dynamic var idContact   = ""
    dynamic var name        = ""
    dynamic var phone       = ""
    dynamic var picture     = ""
    
    required init(dictionary: [String : AnyObject]) {
        idContact       <-- dictionary["id"]
        name            <-- dictionary["name"]
        phone           <-- dictionary["phone"]
        picture         <-- dictionary["picture"]
    }
    
    //MARK: FromJSONFile
    class func jsonParsingFromFile() -> NSMutableArray {
        let path = (NSBundle.mainBundle().pathForResource("contacts_json", ofType: "json"))
        guard let triedPath = path else { return NSMutableArray() }
        var data: NSData?
        do { data = try NSData(contentsOfFile: triedPath as String, options: NSDataReadingOptions.DataReadingMapped) }
        catch { data = nil }
        guard let dataJson = data else { return NSMutableArray() }
        let arrayContacts = NSMutableArray()
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(dataJson, options: .AllowFragments)
            if let dictData = json.objectForKey("contacts") as? NSArray {
                for obj in dictData {
                    var contact :Contact?
                    contact <-- obj
                    arrayContacts.addObject(contact!)
                }
                return arrayContacts
            }
        } catch {
            NSLog("error serializing JSON: \(error)")
        }
        return NSMutableArray()
    }
}