//
//  CustomAlert.swift
//  NeonTransfer
//
//  Created by Vinicius Minozzi on 8/18/16.
//  Copyright © 2016 Vinicius Minozzi All rights reserved.
//

import UIKit

extension UIViewController {
    
    func createCustomAlertViewController(contact: Contact, contactImage: UIImage) {
        self.view.addSubview(self.createShadowView(contact, contactImage: contactImage))
    }
    
    func createShadowView(contact: Contact, contactImage: UIImage) -> UIView {
        let shadowView = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
        shadowView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        shadowView.tag = 999
        shadowView.addSubview(self.createWhiteView(contact, contactImage: contactImage))
        return shadowView
    }
    
    func createWhiteView(contact: Contact, contactImage: UIImage) -> UIView {
        let whiteView = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width - 50, self.view.frame.size.height / 2))
        whiteView.center = self.view.center
        whiteView.backgroundColor = UIColor.whiteColor()
        whiteView.layer.cornerRadius = 10
        whiteView.addSubview(self.createCloseButton())
        whiteView.addSubview(self.createPersonUIImage(whiteView, image: contactImage, contactName: contact.name))
        let labels = (self.createNameAndPhoneLabel(contact.name, phone: contact.phone, whiteView: whiteView))
        whiteView.addSubview(labels.0)
        whiteView.addSubview(labels.1)
        whiteView.addSubview(labels.2)
        whiteView.addSubview(self.addCustomTextField(whiteView))
        whiteView.addSubview(self.addButton(whiteView))
        whiteView.tag = 777
        return whiteView
    }
    
    func createCloseButton() -> UIButton {
        let button = UIButton(frame: CGRectMake(10, 10, 20, 20))
        button.setImage(UIImage(named: "icon_close"), forState: .Normal)
        button.addTarget(self, action: #selector(UIViewController.dismissCustomAlert), forControlEvents: .TouchUpInside)
        return button
    }
    
    func createPersonUIImage(whiteView: UIView, image: UIImage, contactName: String) -> UIView {
        
        let name = contactName.componentsSeparatedByString(" ")
        var initailString = ""
        for string in name { initailString = initailString + String(string.characters.first!) }
    
        let label = UILabel(frame: CGRectMake(0, 0, 80, 80))
        label.text = initailString
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(30)
        label.textColor = ThemeApp.profileBorderImageColor
        
        let personImage = UIImageView(frame: CGRectMake(0, 0, 80, 80))
        personImage.image = image
        let view = UIView(frame: CGRectMake((whiteView.frame.size.width / 2) - 40, 10, 80, 80))
        view.layer.borderColor  = ThemeApp.profileBorderImageColor.CGColor
        view.layer.borderWidth  = 1.0
        view.layer.cornerRadius = 40.0
        view.clipsToBounds = true
        view.addSubview(label)
        view.addSubview(personImage)
        return view
    }
    
    func createNameAndPhoneLabel(name: String, phone: String, whiteView: UIView) -> (UILabel, UILabel, UILabel) {
        let nameLabel = UILabel(frame: CGRectMake(0, 95, whiteView.frame.size.width, 25))
        nameLabel.text = name
        nameLabel.textAlignment = .Center
        nameLabel.font = UIFont.systemFontOfSize(17)
        
        let phoneLabel = UILabel(frame: CGRectMake(0, 120, whiteView.frame.size.width, 15))
        phoneLabel.text = phone
        phoneLabel.textAlignment = .Center
        phoneLabel.font = UIFont.systemFontOfSize(14)
        
        let valueToSend = UILabel(frame: CGRectMake(0, 135, whiteView.frame.size.width, 15))
        valueToSend.text = "Valor a enviar:"
        valueToSend.textAlignment = .Center
        valueToSend.font = UIFont.systemFontOfSize(12)
        
        return (nameLabel, phoneLabel, valueToSend)
    }
    
    func addCustomTextField(whiteView: UIView) -> UITextField {
        let textField = UITextField(frame: CGRectMake(10, whiteView.frame.size.height / 2 + 10, whiteView.frame.size.width - 20, 60))
        textField.backgroundColor = UIColor(hexString: "EFEFEF")
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = ThemeApp.profileBorderImageColor.CGColor
        textField.textAlignment = .Center
        textField.textColor = UIColor(hexString: "00A7DF")
        textField.font = UIFont.boldSystemFontOfSize(35)
        textField.keyboardType = .NumberPad
        textField.tag = 888
        textField.addTarget(self, action: #selector(SendMoneyViewController.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
        textField.text = "R$0,00"
        return textField
    }
    
    func addButton(whiteView: UIView) -> UIButton{
        let button = UIButton(frame: CGRectMake(10, whiteView.frame.size.height - 50, whiteView.frame.size.width - 20, 40))
        button.backgroundColor = UIColor(hexString: "00A7DF")
        button.setTitle("ENVIAR", forState: .Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.layer.cornerRadius = 20
        button.tag = 666
        return button
    }
    
    func dismissCustomAlert(){
        let shadowView = self.view.viewWithTag(999)
        shadowView?.removeFromSuperview()
    }
}