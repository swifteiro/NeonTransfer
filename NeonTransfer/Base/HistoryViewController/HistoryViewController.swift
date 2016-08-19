//
//  HistoryViewController.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/18/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit
import Realm
import SVProgressHUD

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrayTransfers :[TransfersModel] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getTransfers()
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
        return self.arrayTransfers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HistoryCell", forIndexPath: indexPath) as? HistoryCell
        self.tableView(tableView, willDisplayCell: cell!, forRowAtIndexPath: indexPath)
        return cell!
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if self.arrayTransfers.count > 0 {
            let historyCell = cell as? HistoryCell
            let transfer :TransfersModel = self.arrayTransfers[indexPath.row]
            let contactResult = Contact.objectsWithPredicate(NSPredicate(format: "idContact = %@", transfer.idClient))
            if let contact = contactResult.firstObject() as? Contact {
                let historyCellViewModel = HistoryCellModelView(contact: contact, transfer: transfer)
                historyCell?.setupHistoryCell(historyCellViewModel)
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //MARK: GET TRANSFERS
    func getTransfers() {
        SVProgressHUD.show()
        Request.requestAPI(["Token" : "fec15e52-10b3-4f3f-bee9-c55f78989e8b"], callType: .Transfer, successBlock: { (transfers) in
            if transfers?.count > 0 {
                SVProgressHUD.dismiss()
                if let transfersReturn :[TransfersModel] = transfers as? [TransfersModel] {
                    self.arrayTransfers = transfersReturn
                    dispatch_async(dispatch_get_main_queue()) {
                        self.tableView.reloadData()
                    }
                }
            }
        }) { (stringError) in
            SVProgressHUD.dismiss()
        }
    }

}
