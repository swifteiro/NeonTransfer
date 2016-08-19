//
//  ContactCell.swift
//  NeonTransfer
//
//  Created by Vinicius A. Minozzi on 8/18/16.
//  Copyright © 2016 Bruno Santos. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var initialLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileView: UIView!
    typealias CellProtocol = protocol <ContactCellPresentation>
    
    func setupCell(cellProtocol :CellProtocol){
        cellProtocol.setupCellWithContact(self)
    }
}
