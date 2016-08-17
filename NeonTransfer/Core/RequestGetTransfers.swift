//
//  RequestGetTransfers.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/17/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit

import Alamofire
import JSONHelper

class RequestGetTransfers: NSObject {

    // MARK: GET - Transfers
    class func GetTransfers(successBlock : (NSMutableArray? -> ()),
                            failure failureBlock : (String? -> ())) {
        
        let urlString :String = (APIUrls.serverAPI) + (APIUrls.getTransfers)
        
        //fec15e52-10b3-4f3f-bee9-c55f78989e8b - TOKEN
        let parameters :NSDictionary = ["token" : "fec15e52-10b3-4f3f-bee9-c55f78989e8b"] // TODO: TOKEN
        
        Alamofire.request(.GET, urlString, parameters:parameters as? [String : AnyObject])
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    
                    //TODO: OBJ
                    print("é ele que a gente quer")
                    let arrayTransfers = NSMutableArray()
                    if response.result.value?.count > 0 {
                        if let objTransfers = response.result.value as? NSArray {
                            for obj in objTransfers {
                                let objDictionary = obj as? NSDictionary
                                var transfer :TransfersModel?
                                transfer <-- objDictionary
                                arrayTransfers.addObject(transfer!)
                            }
                        }
                        successBlock(arrayTransfers)
                    }
                    
                case .Failure(let error):
                    
                    failureBlock("não vai dar não")
                    print(error)
                }
        }
    }
}
