//
//  ContactCellModelView.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/18/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit

class ContactCellModelView: NSObject, ContactCellPresentation {

    var contact :Contact?
    
    init(contact: Contact) { self.contact = contact }
    
    func setCellTitle() -> String { return self.contact?.name ?? "" }
    
    func setPhoneLabel() -> String { return self.contact?.phone ?? "" }
    
    func setProfileViewBorderColor() -> UIColor {return ThemeApp.profileBorderImageColor }
    
    func setProfieViewBackgroundColor() -> UIColor { return ThemeApp.profileViewCellBackgroundColor }
    
    func setInitialLabel() -> String {
        if let name = self.contact?.name.componentsSeparatedByString(" ") {
            var initailString = ""
            for string in name { initailString = initailString + String(string.characters.first!) }
            return initailString
        }
        return ""
    }
    
    func setImageProfileName() -> String { return self.contact?.picture ?? ""}
}
