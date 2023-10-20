//
//  MostPopularRestaurantCollectionViewCell.swift
//  CusineAppUI
//
//  Created by Enes Kaya on 19.10.2023.
//

import UIKit


class MostPopularRestaurantCollectionViewCell: UICollectionViewCell {
    
    let mostPopularRestaurantImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 7
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mostPopularNameLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mostPopularTypeLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mostPopularOrangeIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "orange_icon")
        view.tintColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mostPopularRatingLabel: UILabel = {
        let view = UILabel()
        view.textColor = .orange
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func configureViews() {
        backgroundColor = .white
        
        addSubview(mostPopularRestaurantImageView)
        mostPopularRestaurantImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mostPopularRestaurantImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        mostPopularRestaurantImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        mostPopularRestaurantImageView.heightAnchor.constraint(equalTo: mostPopularRestaurantImageView.widthAnchor, multiplier: 0.5).isActive = true
        
        addSubview(mostPopularNameLabel)
        mostPopularNameLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        mostPopularNameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        mostPopularNameLabel.topAnchor.constraint(equalTo: mostPopularRestaurantImageView.bottomAnchor, constant: 4).isActive = true
        mostPopularNameLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(mostPopularTypeLabel)
        mostPopularTypeLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        mostPopularTypeLabel.topAnchor.constraint(equalTo: mostPopularNameLabel.bottomAnchor, constant: 4).isActive = true
        mostPopularTypeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        mostPopularTypeLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        
        addSubview(mostPopularOrangeIcon)
        mostPopularOrangeIcon.leftAnchor.constraint(equalTo: mostPopularTypeLabel.rightAnchor, constant: 10).isActive = true
        mostPopularOrangeIcon.centerYAnchor.constraint(equalTo: mostPopularTypeLabel.centerYAnchor).isActive = true
        mostPopularOrangeIcon.heightAnchor.constraint(equalToConstant: 18).isActive = true
        mostPopularOrangeIcon.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        addSubview(mostPopularRatingLabel)
        mostPopularRatingLabel.leftAnchor.constraint(equalTo: mostPopularOrangeIcon.rightAnchor).isActive = true
        mostPopularRatingLabel.topAnchor.constraint(equalTo: mostPopularOrangeIcon.topAnchor).isActive = true
        mostPopularRatingLabel.heightAnchor.constraint(equalTo: mostPopularOrangeIcon.heightAnchor, multiplier: 1).isActive = true
        mostPopularRatingLabel.widthAnchor.constraint(equalTo: mostPopularRatingLabel.heightAnchor, multiplier: 1.5).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
