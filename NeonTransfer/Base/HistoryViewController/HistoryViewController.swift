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
    
    let historyRepresentaition = HistoryViewModel() as HistoryPresentation
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ThemeApp.historyScreenTitle
    }
    
    override func viewWillAppear(animated: Bool) {
        self.getTransfers()
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
        return self.historyRepresentaition.arrayTransfers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HistoryCell", forIndexPath: indexPath) as? HistoryCell
        self.tableView(tableView, willDisplayCell: cell!, forRowAtIndexPath: indexPath)
        return cell!
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if self.historyRepresentaition.arrayTransfers.count > 0 {
            let historyCell = cell as? HistoryCell
            let transfer :TransfersModel = self.historyRepresentaition.arrayTransfers[indexPath.row]
            let contactResult = Contact.objectsWithPredicate(NSPredicate(format: "idContact = %@", transfer.idClient))
            if let contact = contactResult.firstObject() as? Contact {
                let historyCellModelView = HistoryCellModelView(contact: contact)
                historyCellModelView.setDateLabel(transfer.dateTransfer)
                historyCell?.setupCell(historyCellModelView)
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //MARK: GET TRANSFERS
    func getTransfers() {
        SVProgressHUD.show()
        self.historyRepresentaition.getTransfers({ () in
            SVProgressHUD.dismiss()
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
            }) { (stringError) in
                SVProgressHUD.dismiss()
                let alert = UIAlertController(title: ThemeApp.alertTitle, message: stringError, preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: ThemeApp.alertTitleButtonOk, style: UIAlertActionStyle.Default) {
                    UIAlertAction in
                }
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
        }
    }

}
