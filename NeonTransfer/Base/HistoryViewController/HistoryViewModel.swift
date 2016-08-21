//
//  HistoryViewModel.swift
//  NeonTransfer
//
//  Created by Vinicius on 21/08/16.
//  Copyright © 2016 Vinicius Minozzi All rights reserved.
//

import UIKit

class HistoryViewModel: NSObject, HistoryPresentation {
    
    var arrayTransfers = [TransfersModel]()
    
    func getTransfers(successBlock: (Void -> ()),
                      failure failureBlock: (String? -> ())) {
            Request.requestAPI(["Token" : User.getTokenFromUserDefaults()], callType: .Transfer, successBlock: { (transfers) in
                if transfers?.count > 0 {
                    if let transfersReturn :[TransfersModel] = transfers as? [TransfersModel] {
                        self.arrayTransfers = transfersReturn.reverse()
                    }
                    successBlock()
                }
            }) { (stringError) in
                failureBlock(stringError)
            }
    }
}
