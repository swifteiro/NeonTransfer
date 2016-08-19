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
    dynamic var idClient     = ""
    dynamic var token        = ""
    dynamic var value        = ""
    dynamic var dateTransfer = ""
    
    required init(dictionary: [String : AnyObject]) {
        idClient        <-- dictionary["ClienteId"]
        token           <-- dictionary["Token"]
        value           <-- dictionary["Valor"]
        dateTransfer    <-- dictionary["Data"]
    }
}