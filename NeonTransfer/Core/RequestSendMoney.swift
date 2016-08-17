//
//  RequestSendMoney.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/17/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit

import Alamofire

class RequestSendMoney: NSObject {

    // MARK: POST - SendMoney
    class func SendMoney(params : NSDictionary?,
                         successBlock : (NSMutableArray? -> ()),
                         failure failureBlock : (String? -> ())) {
        
        let urlString :String = (APIUrls.serverAPI) + (APIUrls.sendMoney)
        
        //fec15e52-10b3-4f3f-bee9-c55f78989e8b - token
        
        let parameters :NSDictionary = ["ClienteId" : params?.objectForKey("clientId") ?? "", "token" : params?.objectForKey("token") ?? "", "valor" : params?.objectForKey("value") ?? ""] // TODO: PARAMS
        
        Alamofire.request(.POST, urlString, parameters:parameters as? [String : AnyObject])
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    
                    //TODO: OBJ
                    print("é ele que a gente quer") // return: true
                    
                case .Failure(let error):
                    
                    failureBlock("não vai dar não")
                    print(error)
                }
        }
    }
}
