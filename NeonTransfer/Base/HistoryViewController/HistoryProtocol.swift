//
//  HistoryProtocol.swift
//  NeonTransfer
//
//  Created by Vinicius on 21/08/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

protocol HistoryPresentation {
    var arrayTransfers: [TransfersModel] { get }
    
    func getTransfers(successBlock: (Void -> ()),
                      failure failureBlock: (String? -> ()))
}
