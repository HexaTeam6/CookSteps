//
//  ListResepTableViewCell.swift
//  CookSteps
//
//  Created by Abdur Rachman Wahed on 06/04/22.
//

import UIKit

class ListResepTableViewCell: UITableViewCell {
    
    @IBOutlet weak var judulResep: UILabel!
    @IBOutlet weak var deskripsiResep: UILabel!
    @IBOutlet weak var fotoResep: UIImageView!
    @IBOutlet weak var container: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
