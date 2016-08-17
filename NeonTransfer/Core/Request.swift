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
    static let serverAPI = "http://processoseletivoneon.azurewebsites.net/"
    static let generateToken = "GenerateToken"
    static let sendMoney = "SendMoney"
    static let getTransfers = "GetTransfers"
}

struct Request {
    
    // MARK: REQUEST
    static func getToken(params : [String : AnyObject]?, callType: CallType,
                        successBlock : (NSMutableArray? -> ()),
                        failure failureBlock : (String? -> ())) {
        Alamofire.request(isGet(callType) ? .GET : .POST, getServerURL(callType), parameters:params)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    print("é ele que a gente quer")
                    break
                case .Failure(let error):
                    print(error)
                    failureBlock("não vai dar não")
                    break
                }
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
