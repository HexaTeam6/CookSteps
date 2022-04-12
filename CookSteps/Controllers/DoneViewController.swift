//
//  DoneViewController.swift
//  CookSteps
//
//  Created by Abdur Rachman Wahed on 12/04/22.
//

import UIKit

class DoneViewController: UIViewController {
    @IBOutlet weak var quoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        quoteLabel.font = UIFont.italicSystemFont(ofSize: 17)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

}
