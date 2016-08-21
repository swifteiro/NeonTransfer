//
//  SendMoneyProtocol.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/18/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

protocol SendMoneyPresentation {
    var selectedContact: Contact? { get set }
    var arrayContacts: [Contact] { get }
    
    func sendMoneyWithContactAndValue(count: Int, valueString: String,
                                      successBlock: (Void -> ()),
                                      failure failureBlock: (String? -> ()))
}
