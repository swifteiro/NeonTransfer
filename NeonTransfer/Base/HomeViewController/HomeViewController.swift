//
//  HomeViewController.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/17/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let backgroundColor = UIColor.init(red: 31/255, green: 238/255, blue: 154/255, alpha: 1.0)
    typealias HomeProtocol = protocol <HomePresentation>
    
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var buttonSendMoney: UIButton!
    @IBOutlet weak var buttonHistory: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewWillLayoutSubviews()
        self.title = " "
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        let homeViewModel = HomeViewModel(view: self)
        setupView(homeViewModel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView(homeProtocol: HomeProtocol) {
        homeProtocol.setBackgraoundColor(self.backgroundColor, view: self)
        homeProtocol.setupViewProfile(self.backgroundColor, view: self.viewProfile)
        homeProtocol.setupImageViewProfile(self.imgProfile)
        homeProtocol.setupButtonHome(self.buttonSendMoney, title: "ENVIAR DINHEIRO", textColor: self.backgroundColor)
        homeProtocol.setupButtonHome(self.buttonHistory, title: "HISTÓRICO DE ENVIOS", textColor: self.backgroundColor)
    }
    
    @IBAction func goToSendMoney(sender: AnyObject) {
        self.performSegueWithIdentifier("goToSendMoney", sender: self)
    }
    
    @IBAction func goToHistory(sender: AnyObject) {
    }
}
