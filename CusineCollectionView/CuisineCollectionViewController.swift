//
//  CuisineCollectionViewController.swift
//  CusineAppUI
//
//  Created by Enes Kaya on 18.10.2023.
//

import UIKit


class CuisineCollectionViewController: UIViewController {
    
    var cuisineCollectionView : UICollectionView?
    var restaurents = [Restaurents]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = . white
        setupCollectionView()
        
        cuisineCollectionView?.delegate = self
        cuisineCollectionView?.dataSource = self
        
        let minuteByTukTuk = Restaurents(name: "Minute By Tuk Tuk", rate: 4.9, cuisine: "(124 ratings)Cafe      Italy", image: "pizza")
        let cafeDeNoir = Restaurents(name: "Cafe De Noir", rate: 4.2, cuisine: "(280 ratings)Pub        English", image: "eng-breakfast")
        let bakesByTella = Restaurents(name: "Bakes by Tella", rate: 4.5, cuisine: "(1000 ratings)Bakery       Middle Earth", image: "bakery")

        restaurents.append(minuteByTukTuk)
        restaurents.append(cafeDeNoir)
        restaurents.append(bakesByTella)
    }
    
    private func setupCollectionView() {
        //Itemların arasınıbelirttiğimiz yer
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 50, left: 50, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 120, height: 100)
        
        cuisineCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        cuisineCollectionView?.register(CuisineCollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        cuisineCollectionView?.backgroundColor = .clear
        view.addSubview(cuisineCollectionView ?? UICollectionView())
         
    }


}

extension CuisineCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return restaurents.count
    }
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CuisineCollectionViewCell
         cell.restaurentsLabel.text = restaurents[indexPath.row].name
         cell.restaurentsRatingLabel.text = String(restaurents[indexPath.row].rate)
         cell.restaurentsImageView.image = UIImage(named: restaurents[indexPath.row].image)
         cell.restaurentCuisine.text = restaurents[indexPath.row].cuisine
        return cell
    }
}
