//
//  RecomendedResepCollectionViewCell.swift
//  CookSteps
//
//  Created by Abdur Rachman Wahed on 07/04/22.
//

import UIKit

class RecomendedResepCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var judulResep: UILabel!
    @IBOutlet var fotoResep: UIImageView!
    @IBOutlet var background: UIView!
    @IBOutlet var buttonMasak: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
