//
//  HistoryViewController.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/18/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrayContacts :NSMutableArray = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Request.requestAPI(["Token" : "fec15e52-10b3-4f3f-bee9-c55f78989e8b"], callType: .Transfer, successBlock: { (obj) in
            print(obj)
            }) { (stringError) in
                //
        }
        
//        self.arrayContacts = Contact.jsonParsingFromFile()
//        dispatch_async(dispatch_get_main_queue()) {
//            self.tableView.reloadData()
//        }
        self.title = "HISTÓRICO DE ENVIOS"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: UITableViewDelegate/Datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayContacts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HistoryCell", forIndexPath: indexPath) as? HistoryCell
        self.tableView(tableView, willDisplayCell: cell!, forRowAtIndexPath: indexPath)
        return cell!
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        let historyCell = cell as? HistoryCell
//        let contact = self.arrayContacts[indexPath.row]
//        let contactCellViewModel = ContactCellModelView(contact: contact as! HistoryCell)
//        historyCell?.setupCell(contactCellViewModel)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}
