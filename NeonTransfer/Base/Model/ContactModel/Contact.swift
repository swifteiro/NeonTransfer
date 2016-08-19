//
//  Contact.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/17/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit

import JSONHelper
import Realm

class Contact: RLMObject, Deserializable {
    dynamic var idContact   = ""
    dynamic var name        = ""
    dynamic var phone       = ""
    dynamic var picture     = ""
    
    required init(dictionary: [String : AnyObject]) {
        super.init()
        idContact       <-- dictionary["id"]
        name            <-- dictionary["name"]
        phone           <-- dictionary["phone"]
        picture         <-- dictionary["picture"]
    }
    
    //MARK: FromJSONFile
    class func jsonParsingFromFile() -> [Contact] {
        let path = (NSBundle.mainBundle().pathForResource("contacts_json", ofType: "json"))
        guard let triedPath = path else { return [Contact]() }
        var data: NSData?
        do { data = try NSData(contentsOfFile: triedPath as String, options: NSDataReadingOptions.DataReadingMapped) }
        catch { data = nil }
        guard let dataJson = data else { return [Contact]() }
        var arrayContacts = [Contact]()
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(dataJson, options: .AllowFragments)
            if let dictData = json.objectForKey("contacts") as? [Contact] {
                dictData.forEach({arrayContacts.append($0)})
                self.persistContacts(arrayContacts)
                return arrayContacts
            }
        } catch {
            NSLog("error serializing JSON: \(error)")
        }
        
        return [Contact]()
    }
    
    class func getAllObjects() -> [Contact] {
        return Contact.allObjects().toArray(Contact.self)
    }
    
    class func persistContacts(objects: [Contact]?) {
        autoreleasepool {
            guard let objects = objects where objects.count > 0 else { return }
            do {
                let realm = RLMRealm.defaultRealm()
                realm.beginWriteTransaction()
                realm.addObjects(objects)
                try realm.commitWriteTransaction()
            } catch {
                print("Realm did not write objects! \(objects)")
            }
        }
    }
}

extension RLMResults {
    func toArray<T>(ofType: T.Type) -> [T] {
        return (0..<self.count).flatMap { self.objectAtIndex($0) as? T }
    }
}
