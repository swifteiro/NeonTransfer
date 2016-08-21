//
//  Request.swift
//  NeonTransfer
//
//  Created by Bruno Henrique Machado dos Santos on 8/17/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//


import Alamofire

enum CallType {
    case Token
    case Transfer
    case SendMoney
}

struct APIUrls {
    static let serverAPI     = "http://processoseletivoneon.azurewebsites.net/"
    static let generateToken = "GenerateToken"
    static let sendMoney     = "SendMoney"
    static let getTransfers  = "GetTransfers"
}

struct Request {
    
    // MARK: REQUEST
    static func requestAPI(params : [String : AnyObject]?, callType: CallType,
                           successBlock : ([AnyObject]? -> ()),
                           failure failureBlock : (String? -> ())) {
        if Reachability.isConnectedToNetwork() {
            Alamofire.request(isGet(callType) ? .GET : .POST, getServerURL(callType), parameters:params)
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .Success:
                        switch callType {
                        case .Token:
                            User.sharedInstance.setUser(["name" : "Vinicius", "email" : "vin.minozzi@gmail.com", "token" : response.result.value ?? "", "picture" : "img_profile"])
                            Contact.jsonParsingFromFile()
                            successBlock([true])
                            break
                        case .SendMoney:
                            break
                        case .Transfer:
                            if let results = response.result.value as? [AnyObject] {
                                var transfers = [TransfersModel]()
                                results.forEach({if $0 is [String : AnyObject] { transfers.append(TransfersModel(dictionary: $0 as! [String : AnyObject])) }})
                                successBlock(transfers)
                            }
                            break
                        }
                        break
                    case .Failure(let error):
                        print(error)
                        failureBlock("não vai dar não")
                        break
                    }
            }
        } else {
            failureBlock("Sem conexão com a internet.")
        }
    }
    
    static func isGet(callType: CallType) -> Bool { return callType == .SendMoney ? false : true }
    
    static func getServerURL(callType: CallType) -> String {
        switch callType {
        case .Token:
            return (APIUrls.serverAPI) + (APIUrls.generateToken)
        case .Transfer:
            return (APIUrls.serverAPI) + (APIUrls.getTransfers)
        case .SendMoney:
            return (APIUrls.serverAPI) + (APIUrls.sendMoney)
        }
    }
}
