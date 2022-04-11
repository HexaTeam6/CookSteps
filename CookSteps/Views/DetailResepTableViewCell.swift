//
//  DetailResepTableViewCell.swift
//  CookSteps
//
//  Created by Abdur Rachman Wahed on 09/04/22.
//

import UIKit

protocol DetailResepTableViewCellDelegate: AnyObject {
    func checkBoxToggle(sender: DetailResepTableViewCell)
}

class DetailResepTableViewCell: UITableViewCell {
    
    weak var delegate: DetailResepTableViewCellDelegate?
    
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var detailDesc: UILabel!
    @IBOutlet var detailImageButton: UIButton!
    @IBOutlet var detailCheckbox: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        detailDesc.font = UIFont.italicSystemFont(ofSize: 14)
    }
    
    @IBAction func checkToggled(_ sender: UIButton) {
        delegate?.checkBoxToggle(sender: self)
    }
    
}
