//
//  HomeViewModel.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/17/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit
import SVProgressHUD

class HomeViewModel: NSObject, HomePresentation {
    
    func setBackgroundColor() -> UIColor { return ThemeApp.homeBackGroundColor }
    
    func setupViewProfile() -> UIColor { return ThemeApp.homeProfleView }
    
    func setupImageViewProfile() -> String { return ThemeApp.profileImageName }
    
    func setupButtonsHome() -> (String, String, UIColor, CGFloat) { return (ThemeApp.homeButtonSendMoneyTitle, ThemeApp.homeButtonHistoryTitle, ThemeApp.buttonsHomeColor, CGFloat(20.0)) }
    
    func getToken(failure failureBlock : (String? -> ())) {
        if User.isFirstAccess() {
            SVProgressHUD.show()
            Request.requestAPI([MockedUser.keyName : MockedUser.name, MockedUser.keyEmail : MockedUser.email], callType: .Token, successBlock: { (token) in
                SVProgressHUD.dismiss()
            }) { (stringError) in
                SVProgressHUD.dismiss()
                failureBlock(stringError)
            }
        }
    }
}
