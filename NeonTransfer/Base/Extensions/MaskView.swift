//
//  MaskView.swift
//  NeonTransfer
//
//  Created by Vinicius on 20/08/16.
//  Copyright © 2016 Vinicius Minozzi All rights reserved.
//

import UIKit

extension UIImage {
    var circleMask: UIImage {
        let square = CGSize(width: min(size.width, size.height), height: min(size.width, size.height))
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: square))
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.image = self
        imageView.layer.cornerRadius = square.width/2
        imageView.layer.borderColor = UIColor.blueColor().CGColor
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContext(imageView.bounds.size)
        imageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}

extension UIView {
    var circleMask: UIView {
        let square = CGSize(width: min(frame.size.width, frame.size.height), height: min(frame.size.width, frame.size.height))
        frame = (frame: CGRect(origin: CGPoint(x: frame.origin.x, y: frame.origin.y), size: square))
        contentMode = UIViewContentMode.ScaleAspectFill
        layer.cornerRadius = square.width/2
        layer.borderColor = UIColor.whiteColor().CGColor
        layer.borderWidth = 1
        layer.masksToBounds = true
        UIGraphicsBeginImageContext(bounds.size)
        layer.renderInContext(UIGraphicsGetCurrentContext()!)
        return self
    }
}
