//
//  ResepViewController.swift
//  CookSteps
//
//  Created by Abdur Rachman Wahed on 07/04/22.
//

import UIKit

class ResepViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var categoryCollectionView: UICollectionView!
    let listResep: [Resep] = Resep.recomended()
    let listCategory: [String] = ["Simpel", "Nasi", "Mie", "Ayam", "Ikan", "Siap Saji", "Kuah", "Ber-2", "Sayuran", "Seafood"]
    
    @IBOutlet var fotoPilihan: UIImageView!
    @IBOutlet var containerPilihan: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCollectionView(collectionView, nibName: "RecomendedResepCollectionViewCell")
        initCollectionView(categoryCollectionView, nibName: "CategoryViewCollectionViewCell")
        
        self.view.addSubview(collectionView)
        self.view.addSubview(categoryCollectionView)
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 60, height: 80)
        categoryCollectionView!.collectionViewLayout = layout
        
        fotoPilihan.backgroundColor = .gray
        fotoPilihan.layer.cornerRadius = 8
        containerPilihan.layer.cornerRadius = 8
    }
    
    //MARK: - CollectionView func
    
    func initCollectionView(_ collectionView: UICollectionView, nibName: String) -> Void {
        let nib = UINib(nibName: nibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: nibName)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return listResep.count
        }
        else {
            return listCategory.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecomendedResepCollectionViewCell", for: indexPath) as! RecomendedResepCollectionViewCell
            let resep = listResep[indexPath.row]
            
            cell.judulResep?.text = resep.judulResep
            cell.fotoResep?.backgroundColor = .gray
            
            cell.buttonMasak.addTarget(self, action: #selector(masakButtonTapped), for: .touchUpInside)
            
            cell.fotoResep?.layer.cornerRadius = 8
            cell.background?.backgroundColor = .clear
            cell.buttonMasak?.layer.cornerRadius = 0
            
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryViewCollectionViewCell", for: indexPath) as! CategoryViewCollectionViewCell
            let category = listCategory[indexPath.row]
            
            cell.namaKatergori?.text = category
            cell.container?.layer.cornerRadius = 8
            
            return cell
        }
    }
    
    // MARK: - Action
    @IBAction func masakButtonTapped() -> Void {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let detailResepVC = storyBoard.instantiateViewController(withIdentifier: "DetailResep") as! DetailResepViewController
        detailResepVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailResepVC, animated: true)
    }
}
