//
//  HomeProtocol.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/17/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit

protocol HomePresentation {
    
    func setBackgraoundColor(color: UIColor, view: HomeViewController)
    func setupViewProfile(color: UIColor, view: UIView)
    func setupImageViewProfile(img: UIImageView)
}
