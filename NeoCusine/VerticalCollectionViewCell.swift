//
//  VerticalCollectionViewCell.swift
//  CusineAppUI
//
//  Created by Enes Kaya on 19.10.2023.
//

import UIKit
class VerticalCollectionViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: contentView.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "verticalCollectionCell")
        contentView.addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Dikey Collection View için verileri doldur
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Dikey Collection View'da görüntülenmesi gereken öğelerin sayısı
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "verticalCollectionCell", for: indexPath)
        // Hücre içeriğini doldur
        // Örnek olarak, her hücreye bir resim veya metin ekleyebilirsiniz.
        return cell
    }
}
