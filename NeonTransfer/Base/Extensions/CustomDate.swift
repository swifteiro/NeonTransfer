//
//  CustomDate.swift
//  NeonTransfer
//
//  Created by Vinicius on 21/08/16.
//  Copyright © 2016 Vinicius Minozzi All rights reserved.
//

import UIKit

extension NSDateFormatter {
    func dateFromTransferString(dateString: String) -> NSDate? {
        self.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SS"
        self.timeZone = NSTimeZone(abbreviation: "UTC")
        self.locale = NSLocale(localeIdentifier: "pt_BR")
        return self.dateFromString(dateString)
    }
}