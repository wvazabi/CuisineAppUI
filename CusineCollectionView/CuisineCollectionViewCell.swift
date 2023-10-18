//
//  CuisineCollectionViewCell.swift
//  CusineAppUI
//
//  Created by Enes Kaya on 18.10.2023.
//

import UIKit

class CuisineCollectionViewCell: UICollectionViewCell {
    
    
    let restaurentsImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let restaurentsLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let restaurentsRatingLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let restaurentCuisine : UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let orangeIconImageView: UIImageView = {
           let imageView = UIImageView()
           imageView.image = UIImage(named: "orange_icon") // Turuncu ikonunuzun adını kullanın
           imageView.contentMode = .scaleAspectFit
           imageView.translatesAutoresizingMaskIntoConstraints = false
           return imageView
       }()
    
    
    
    
    private func addViews() {
        
        backgroundColor = .white
        addSubview(restaurentsLabel)
        addSubview(restaurentsRatingLabel)
        addSubview(restaurentsImageView)
        addSubview(restaurentCuisine)
        addSubview(orangeIconImageView)
        
        restaurentsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        restaurentsImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        //restaurentsImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        //restaurentsImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        restaurentsImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        restaurentsImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        restaurentsLabel.topAnchor.constraint(equalTo: restaurentsImageView.bottomAnchor, constant: 10).isActive = true
        restaurentsLabel.leftAnchor.constraint(equalTo: leftAnchor,constant: 10).isActive = true
        restaurentsLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        restaurentsRatingLabel.topAnchor.constraint(equalTo: restaurentsLabel.bottomAnchor, constant: 5).isActive = true
        restaurentsRatingLabel.leftAnchor.constraint(equalTo: orangeIconImageView.rightAnchor, constant: 1).isActive = true
       // restaurentsRatingLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        restaurentCuisine.leftAnchor.constraint(equalTo: restaurentsRatingLabel.rightAnchor,constant: 5).isActive = true
        restaurentCuisine.topAnchor.constraint(equalTo: restaurentsLabel.bottomAnchor, constant: 5).isActive = true
        //restaurentCuisine.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        NSLayoutConstraint.activate([
            orangeIconImageView.topAnchor.constraint(equalTo: restaurentsLabel.bottomAnchor, constant: 0),
                    orangeIconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
                    orangeIconImageView.widthAnchor.constraint(equalToConstant: 35), // İkonun genişliği
                    orangeIconImageView.heightAnchor.constraint(equalToConstant: 35) // İkonun yüksekliği
                ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
