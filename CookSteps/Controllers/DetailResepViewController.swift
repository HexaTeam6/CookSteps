//
//  DetailResepViewController.swift
//  CookSteps
//
//  Created by Abdur Rachman Wahed on 08/04/22.
//

import UIKit

class DetailResepViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DetailResepTableViewCellDelegate {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var table_height: NSLayoutConstraint!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var estimasiContainer: UIView!
    @IBOutlet weak var catatanContainer: UIView!
    @IBOutlet weak var mulaiButton: UIButton!
    @IBOutlet weak var estimasiLabel: UILabel!
    @IBOutlet weak var porsiLabel: UILabel!
    
    private var instructionCounter: Int = 1
    
    private var listDetail = DetailResep.sampleData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "DetailResepTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailResepTableViewCell")
        tableView.register(UINib(nibName: "HeaderDetailResepTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderDetailResepTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        title = "Detail Resep"
        navigationItem.largeTitleDisplayMode = .never
        
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        estimasiContainer.layer.cornerRadius = 8
        catatanContainer.layer.cornerRadius = 8
        mulaiButton.layer.cornerRadius = 8
        tableView.layer.cornerRadius = 8
        estimasiLabel.font = UIFont.italicSystemFont(ofSize: 14)
        porsiLabel.font = UIFont.italicSystemFont(ofSize: 14)
    }
    
    // MARK: - Auto height tableView
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        self.tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tableView.removeObserver(self, forKeyPath: "contentSize")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            if let newValue = change?[.newKey] {
                let newSize = newValue as! CGSize
                self.table_height.constant = newSize.height
            }
        }
    }
    
    // MARK: - tabelView func
    func numberOfSections(in tableView: UITableView) -> Int {
        return listDetail.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = listDetail[section]
        
        if section.isOpened {
            return section.options.count + 1
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // section
        if indexPath.row == 0 {
            instructionCounter = 1
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderDetailResepTableViewCell", for: indexPath) as! HeaderDetailResepTableViewCell
            cell.headerLabel.text = listDetail[indexPath.section].section
            
            let imageName = listDetail[indexPath.section].isOpened ? "chevron.down" : "chevron.right"
            let image = UIImage(systemName: imageName)
            cell.collapseButton.setImage(image, for: .normal)
            
            cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
            
            return cell
        }
        // cell member section
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailResepTableViewCell", for: indexPath) as! DetailResepTableViewCell
            cell.detailLabel.text = listDetail[indexPath.section].options[indexPath.row - 1].optionName
            cell.detailDesc.text = listDetail[indexPath.section].options[indexPath.row - 1].optionDesc
            
            if listDetail[indexPath.section].options[indexPath.row - 1].isInstruction {
                cell.detailImageButton.isHidden = true
                
                let image = UIImage(systemName: "\(instructionCounter).circle")
                cell.detailCheckbox.setImage(image, for: .normal)
                instructionCounter += 1
                cell.detailCheckbox.tintColor = UIColor.init(red: 1, green: 0.650, blue: 0.066, alpha: 1)
            }
            else {
                cell.delegate = self
                cell.detailCheckbox.isSelected = listDetail[indexPath.section].options[indexPath.row - 1].isChecked
                
                cell.detailImageButton.isHidden = false

                var imageName:String
                
                if cell.detailCheckbox.isSelected {
                    imageName = "checkmark.square.fill"
                    cell.detailCheckbox.tintColor = UIColor.init(red: 1, green: 0.650, blue: 0.066, alpha: 1)
                }
                else {
                    imageName = "square.fill"
                    cell.detailCheckbox.tintColor = .systemGray5
                }
                
                let image = UIImage(systemName: imageName)
                cell.detailCheckbox.setImage(image, for: .normal)
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        instructionCounter = 1
        tableView.deselectRow(at: indexPath, animated: true)
        
        listDetail[indexPath.section].isOpened = !listDetail[indexPath.section].isOpened
        tableView.reloadSections([indexPath.section], with: .none)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // MARK: - DetailResepCell Delegate
    func checkBoxToggle(sender: DetailResepTableViewCell) {
        if let selectedIndexPath = tableView.indexPath(for: sender) {
            listDetail[selectedIndexPath.section].options[selectedIndexPath.row - 1].isChecked = !listDetail[selectedIndexPath.section].options[selectedIndexPath.row - 1].isChecked
            
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        }
    }
    
    // MARK: - Action
    @IBAction func favoriteButtonTapped() -> Void {
        let primaryColor = UIColor.init(red: 1, green: 0.650, blue: 0.066, alpha: 1)
        favoriteButton.tintColor = favoriteButton.tintColor == primaryColor ? .systemGray4 : primaryColor
    }
}
