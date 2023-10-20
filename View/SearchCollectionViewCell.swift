//
//  CustomCollectionViewCell.swift
//  CusineAppUI
//
//  Created by Enes Kaya on 18.10.2023.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    let cuisineImageView : UIImageView = {
       let imageView = OvalImageView()
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let cuisineLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func addViews() {
        
        backgroundColor = .white
        addSubview(cuisineLabel)
        addSubview(cuisineImageView)
        
        cuisineImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cuisineImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        cuisineImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        cuisineImageView.heightAnchor.constraint(equalTo: cuisineImageView.widthAnchor, multiplier: 1).isActive = true
        
        cuisineLabel.topAnchor.constraint(equalTo: cuisineImageView.bottomAnchor, constant: 5).isActive = true
        cuisineLabel.leftAnchor.constraint(equalTo: cuisineImageView.leftAnchor).isActive = true
        cuisineLabel.rightAnchor.constraint(equalTo: cuisineImageView.rightAnchor).isActive = true
        cuisineLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
       
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
