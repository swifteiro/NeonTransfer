//
//  ViewController.swift
//  NeonTransfer
//
//  Created by Bruno Henrique Machado dos Santos on 8/17/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let array = Contact.jsonParsingFromFile()
        print(array)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

