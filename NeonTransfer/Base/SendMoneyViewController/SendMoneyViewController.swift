//
//  SendMoneyViewController.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/18/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit

class SendMoneyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrayContacts :NSMutableArray = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arrayContacts = Contact.jsonParsingFromFile()
        dispatch_async(dispatch_get_main_queue()) { 
            self.tableView.reloadData()
        }
        self.title = "EVIAR DINHEIRO"
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
        let cell = tableView.dequeueReusableCellWithIdentifier("ContacCell", forIndexPath: indexPath) as? ContactCell
        self.tableView(tableView, willDisplayCell: cell!, forRowAtIndexPath: indexPath)
        return cell!
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let contactCell = cell as? ContactCell
        let contact = self.arrayContacts[indexPath.row] 
        let contactCellViewModel = ContactCellModelView(contact: contact as! Contact)
        contactCell?.setupCell(contactCellViewModel)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
