//
//  HistoryCellModelView.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/18/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit

class HistoryCellModelView: NSObject, ContactCellPresentation {
    
    var contact :Contact?
    
    init(contact: Contact) { self.contact = contact }
    
    func setupCellWithContact(cell: ContactCell) {
        cell.nameLabel.text = self.contact?.name
        cell.phoneLabel.text = self.contact?.phone
        cell.profileView?.circleMask
        cell.profileView.layer.borderColor = UIColor.init(red: 21/255, green: 153/255, blue: 218/255, alpha: 1).CGColor
        cell.profileView.backgroundColor = UIColor.clearColor()
        cell.backgroundColor = UIColor.clearColor()
        
        if let name = self.contact?.name.componentsSeparatedByString(" ") {
            var initailString = ""
            for string in name { initailString = initailString + String(string.characters.first!) }
            cell.initialLabel.text = initailString
        }
    }
}
