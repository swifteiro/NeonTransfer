//
//  ContactCellProtocol.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/18/16.
//  Copyright © 2016 Vinicius Minozzi All rights reserved.
//

import UIKit

protocol ContactCellPresentation {
    
    func setCellTitle() -> String
    func setPhoneLabel() -> String
    func setProfileViewBorderColor() -> UIColor
    func setProfieViewBackgroundColor() -> UIColor
    func setInitialLabel() -> String
    func setImageProfileName() -> String
}
