//
//  HistoryCell.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/18/16.
//  Copyright © 2016 Vinicius Minozzi All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {

    @IBOutlet weak var initialLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileView: UIView!
    
    func setupCell(cellProtocol: HistoryCellPresentation){
        self.initialLabel.text = cellProtocol.setInitialLabel()
        self.nameLabel.text = cellProtocol.setCellTitle()
        self.phoneLabel.text = cellProtocol.setPhoneLabel()
        self.profileImg.sd_setImageWithURL(NSURL(string: cellProtocol.setImageProfileName()), placeholderImage:UIImage())
        self.profileView?.circleMask
        self.profileView.backgroundColor = cellProtocol.setProfieViewBackgroundColor()
        self.profileView.layer.borderColor = cellProtocol.setProfileViewBorderColor().CGColor
        self.dateLabel.text = cellProtocol.stringDate
    }
}
