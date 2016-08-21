//
//  HomeProtocol.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/17/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit

protocol HomePresentation {
    func setBackgroundColor() -> UIColor
    func setupViewProfile() -> UIColor
    func setupImageViewProfile() -> String
    func setupButtonsHome() -> (String, String, UIColor, CGFloat)
    func getToken(failure failureBlock : (String? -> ()))
}