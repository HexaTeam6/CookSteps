//
//  DisukaiViewController.swift
//  CookSteps
//
//  Created by Abdur Rachman Wahed on 06/04/22.
//

import UIKit

class DisukaiViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate {
    
    @IBOutlet var tableView: UITableView!
    let searchController = UISearchController()
    let listResep: [Resep] = Resep.favorite()
    var filteredResep: [Resep] = [Resep]()

    override func viewDidLoad() {
        super.viewDidLoad()
        initSearchController()

        let nib = UINib(nibName: "ListResepTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ListResepTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGray6
        tableView.separatorColor = UIColor.clear
    }
    
    // MARK: - SearchController Func
    
    func initSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["Semua", "Nasi", "Ayam", "Digoreng", "Pedas"]
        searchController.searchBar.placeholder = "Cari"
        searchController.searchBar.tintColor = UIColor.init(red: 1, green: 0.650, blue: 0.066, alpha: 1)
        searchController.searchBar.delegate = self
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = searchBar.text!
        
        filterForSearchTextAndScopeButton(searchText: searchText, scopeButton: scopeButton)
    }
    
    func filterForSearchTextAndScopeButton(searchText: String, scopeButton: String = "Semua") {
        filteredResep = listResep.filter{
            resep in
            let scopeMatch = (scopeButton == "Semua" || resep.judulResep.lowercased().contains(scopeButton.lowercased()))
            
            if searchController.searchBar.text != "" {
                let searchTextMatch = resep.judulResep.lowercased().contains(searchText.lowercased())
                
                return scopeMatch && searchTextMatch
            }
            else {
                return scopeMatch
            }
        }
        
        tableView.reloadData()
    }
    
    // MARK: - TableView Func
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive { return filteredResep.count }
        return listResep.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListResepTableViewCell", for: indexPath) as! ListResepTableViewCell
        let resep: Resep!
        
        if searchController.isActive { resep = filteredResep[indexPath.row] }
        else { resep = listResep[indexPath.row] }
        
        cell.judulResep?.text = resep.judulResep
        cell.deskripsiResep?.text = resep.judulResep
        cell.fotoResep?.backgroundColor = .gray
        
        cell.buttonBuat.addTarget(self, action: #selector(buatButtonTapped), for: .touchUpInside)
        
        cell.fotoResep?.layer.cornerRadius = 8
        cell.container?.layer.cornerRadius = 8
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 91
    }
    
    // MARK: - Action
    @IBAction func buatButtonTapped() -> Void {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let detailResepVC = storyBoard.instantiateViewController(withIdentifier: "DetailResep") as! DetailResepViewController
        detailResepVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailResepVC, animated: true)
    }
}
