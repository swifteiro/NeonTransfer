//
//  SendMoneyViewController.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/18/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit
import Realm
import SVProgressHUD

class SendMoneyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    let currencyFormatter = NSNumberFormatter()
    var sendMoneyRepresentation = SendMoneyViewModel() as SendMoneyPresentation
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ThemeApp.sendMoneyScreenTitle
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        currencyFormatter.locale = NSLocale(localeIdentifier: "pt_BR")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SendMoneyViewController.keyboardWillShow), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SendMoneyViewController.keyboardWillHide), name:UIKeyboardWillHideNotification, object: nil);
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(UIKeyboardWillShowNotification)
        NSNotificationCenter.defaultCenter().removeObserver(UIKeyboardWillHideNotification)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.keyboardWillHide()
    }
    
    //MARK: UITableViewDelegate/Datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sendMoneyRepresentation.arrayContacts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ContacCell", forIndexPath: indexPath) as? ContactCell
        self.tableView(tableView, willDisplayCell: cell!, forRowAtIndexPath: indexPath)
        return cell!
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let contactCell = cell as? ContactCell
        let contact = self.sendMoneyRepresentation.arrayContacts[indexPath.row]
        let contactCellViewModel = ContactCellModelView(contact: contact)
        contactCell?.setupCell(contactCellViewModel)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.createCustomAlertViewController()
        self.setAlertButtonMethod()
        self.sendMoneyRepresentation.selectedContact = self.sendMoneyRepresentation.arrayContacts[indexPath.row]
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //MARK: Alert
    func alertTapped() {
        let textField = self.view.viewWithTag(888) as? UITextField
        textField?.resignFirstResponder()
        
        self.sendMoneyRepresentation.sendMoneyWithContactAndValue(textField?.text?.characters.count ?? 0, valueString: textField?.text ?? "", successBlock: { () in
            SVProgressHUD.dismiss()
            self.dismissCustomAlert()
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
    
    func keyboardWillShow(){
        UIView.animateWithDuration(1) {
            self.view.frame = CGRectMake(0, -80, self.view.frame.size.width, self.view.frame.size.height)
        }
    }
    
    func keyboardWillHide(){
        if let textField = self.view.viewWithTag(888) as? UITextField {
            UIView.animateWithDuration(1, animations: {
                self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                textField.resignFirstResponder()
            })
        }
    }
    
    //MARK:TextfieldDelegate
    func textFieldDidChange(textField: UITextField) {
        let text = textField.text!.stringByReplacingOccurrencesOfString(currencyFormatter.currencySymbol, withString: "").stringByReplacingOccurrencesOfString(currencyFormatter.groupingSeparator, withString: "").stringByReplacingOccurrencesOfString(currencyFormatter.decimalSeparator, withString: "")
        textField.text = currencyFormatter.stringFromNumber((text as NSString).doubleValue / 100.0)
    }
    
    //MARK: CustomAlertSetting
    func setAlertButtonMethod() {
        guard let shadowView = self.view.subviews.filter({$0.tag == 999}).first else { return }
        guard let whiteView = shadowView.subviews.filter({$0.tag == 777}).first else { return }
        guard let button = whiteView.subviews.filter({$0.tag == 666}).first as? UIButton else { return }
        button.addTarget(self, action: #selector(SendMoneyViewController.alertTapped), forControlEvents: .TouchUpInside)
        if let textFieldAlert = self.view.viewWithTag(888) as? UITextField { textFieldAlert.delegate = self }
    }
}
