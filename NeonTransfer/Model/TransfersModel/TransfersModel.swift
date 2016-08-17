//
//  TransfersModel.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/17/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit

import JSONHelper

class TransfersModel: Deserializable {

    static let idCliente = "ClienteId"
    static let token = "Token"
    static let value = "Valor"
    static let dateTransfer = "Data"
    
    private(set) var idCliente: String?
    private(set) var token: String?
    private(set) var value = Double?()
    private(set) var dateTransfer = NSDate?()
    
    required init(dictionary: [String : AnyObject]) {
        idCliente <-- dictionary[TransfersModel.idCliente]
        token <-- dictionary[TransfersModel.token]
        value <-- dictionary[TransfersModel.value]
        dateTransfer <-- dictionary[TransfersModel.dateTransfer]
    }
}