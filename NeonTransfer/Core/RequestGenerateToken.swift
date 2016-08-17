//
//  RequestGenerateToken.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/17/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit

import Alamofire

class RequestGenerateToken: NSObject {
    
    // MARK: GET - Token
    class func getToken(params : NSDictionary?,
                        successBlock : (NSMutableArray? -> ()),
                        failure failureBlock : (String? -> ())) {
        
        let urlString :String = (APIUrls.serverAPI) + (APIUrls.generateToken)
        let parameters :NSDictionary = ["nome" : params?.objectForKey("name") ?? "", "email" : params?.objectForKey("email") ?? ""] // TODO: PARAMS
        
        Alamofire.request(.GET, urlString, parameters:parameters as? [String : AnyObject])
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    
                    //TODO: OBJ TOKEN
                    // return: token
                    print("é ele que a gente quer")
                    
                case .Failure(let error):
                    
                    failureBlock(error.description)
                    print("não vai dar não")
                }
        }
    }
}
