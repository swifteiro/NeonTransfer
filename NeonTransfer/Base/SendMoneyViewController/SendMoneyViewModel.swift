//
//  SendMoneyViewModel.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/18/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit
import SVProgressHUD

class SendMoneyViewModel: NSObject, SendMoneyPresentation {
    
    var selectedContact: Contact?
    var arrayContacts = Contact.getAllObjects()

    func sendMoneyWithContactAndValue(count: Int, valueString: String,
                                      successBlock: (Void -> ()),
                                      failure failureBlock: (String? -> ())) {
        
        if count == 0 {
            failureBlock("Valor inválido.")
            return
        }
        
        var value = valueString.stringByReplacingOccurrencesOfString("R$", withString: "")
        value = value.stringByReplacingOccurrencesOfString(".", withString: "")
        value = value.stringByReplacingOccurrencesOfString(",", withString: ".")
        
        guard let selectedContact = self.selectedContact else { return }
        
        Request.requestAPI(["ClienteId" : selectedContact.idContact, "Token" : User.getTokenFromUserDefaults(), "valor" : Double(value)!], callType: .Transfer, successBlock: { (obj) in
            successBlock()
        }) { (stringError) in
            failureBlock(stringError)
        }
    }
}

