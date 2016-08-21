//
//  HomeViewController.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/17/16.
//  Copyright © 2016 Vinicius Minozzi All rights reserved.
//

import UIKit
import SVProgressHUD

struct MockedUser {
    static let keyName  = "nome"
    static let keyEmail = "email"
    static let name     = "Vinicius"
    static let email    = "vin.minozzi@gmail.com"
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var buttonSendMoney: UIButton!
    @IBOutlet weak var buttonHistory: UIButton!
    let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewWillLayoutSubviews()
        self.title = " "
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        
        setupView(homeViewModel)
        homeViewModel.getToken { (stringError) in
            let alert = UIAlertController(title: ThemeApp.alertTitle, message: stringError, preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: ThemeApp.alertTitleButtonOk, style: UIAlertActionStyle.Default) {
                UIAlertAction in
            }
            alert.addAction(okAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupView(homeProtocol: HomePresentation) {
        self.view.backgroundColor = homeProtocol.setBackgroundColor()
        self.viewProfile.backgroundColor = homeProtocol.setupViewProfile()
        self.viewProfile.circleMask
        self.imgProfile.image = UIImage(named: homeProtocol.setupImageViewProfile())
        self.imgProfile.circleMask
        let buttonsSettings = homeProtocol.setupButtonsHome()
        self.buttonSendMoney.setTitle(buttonsSettings.0, forState: .Normal)
        self.buttonSendMoney.setTitleColor(buttonsSettings.2, forState: .Normal)
        self.buttonHistory.setTitle(buttonsSettings.1, forState: .Normal)
        self.buttonHistory.setTitleColor(buttonsSettings.2, forState: .Normal)
        self.buttonSendMoney.layer.cornerRadius = buttonsSettings.3
        self.buttonHistory.layer.cornerRadius = buttonsSettings.3
    }
    
    @IBAction func goToSendMoney(sender: AnyObject) {
        self.performSegueWithIdentifier("goToSendMoney", sender: self)
    }
    
    @IBAction func goToHistory(sender: AnyObject) {
        self.performSegueWithIdentifier("goToHistory", sender: self)
    }
}
