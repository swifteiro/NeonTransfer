//
//  HistoryCellModelView.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/18/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit

class HistoryCellModelView: NSObject, HistoryCellPresentation {
    
    var contact :Contact?
    var transfer: TransfersModel?
    
    init(contact: Contact, transfer: TransfersModel) {
        self.contact = contact
        self.transfer = transfer
    }
    
    func setupCellWithContact(cell: HistoryCell) {
        cell.nameLabel.text = self.contact?.name
        cell.phoneLabel.text = self.contact?.phone
        cell.profileView?.circleMask
        cell.profileView.layer.borderColor = UIColor.init(red: 21/255, green: 153/255, blue: 218/255, alpha: 1).CGColor
        cell.profileView.backgroundColor = UIColor.clearColor()
        cell.backgroundColor = UIColor.clearColor()
        
        guard let createdDateString = self.transfer?.dateTransfer else {
            return
        }
        let dateFormatter = NSDateFormatter()
        let createdDate = dateFormatter.dateFromTransferString(createdDateString)
        dateFormatter.dateFormat = "dd 'de' MMMM 'de' yyyy', às' HH'h'mm"
        cell.dateLabel.text = dateFormatter.stringFromDate(createdDate!)
        
        if let name = self.contact?.name.componentsSeparatedByString(" ") {
            var initailString = ""
            for string in name { initailString = initailString + String(string.characters.first!) }
            cell.initialLabel.text = initailString
        }
    }
}

extension NSDateFormatter {
    func dateFromTransferString(dateString: String) -> NSDate? {
        self.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SS"
        self.timeZone = NSTimeZone(abbreviation: "UTC")
        self.locale = NSLocale(localeIdentifier: "pt_BR")
        return self.dateFromString(dateString)
    }
}
