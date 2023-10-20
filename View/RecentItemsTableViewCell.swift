//
//  RecentItemsTableViewCell.swift
//  CusineAppUI
//
//  Created by Enes Kaya on 19.10.2023.
//

import Foundation

import UIKit
//import Hero

class RecentItemsTableViewCell: UITableViewCell {
    
    let itemImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 8
        //imageView.hero.id = "heroImageView"
        return imageView
    }()
    
    let itemNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        //label.font = .init(name: "Metropolis-Bold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.hero.id = "primaryLabel"
        return label
    }()
    
    let itemRestaurantNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        //label.font = .init(name: "Metropolis-Medium", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.hero.id = "secondaryLabel"
        return label
    }()
    
    let starImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "orange_icon")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .orange
        //imageView.hero.id = "starImage"
        return imageView
    }()
    
    let itemRestaurantRatingLabel : UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.textAlignment = .left
        //label.font = .init(name: "Metropolis-Bold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.hero.id = "ratingLabel"
        return label
    }()
    
    let ratingCountLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        //label.font = .init(name: "Metropolis-Regular", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.hero.id = "ratingCountLabel"
        return label
    }()
    
    private func addViews() {
        backgroundColor = .white
        
        addSubview(itemImageView)
        itemImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        itemImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        itemImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        itemImageView.widthAnchor.constraint(equalTo: itemImageView.heightAnchor, multiplier: 1).isActive = true
        
        addSubview(itemNameLabel)
        itemNameLabel.leftAnchor.constraint(equalTo: itemImageView.rightAnchor, constant: 16).isActive = true
        itemNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        itemNameLabel.topAnchor.constraint(equalTo: itemImageView.topAnchor).isActive = true
        itemNameLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(itemRestaurantNameLabel)
        itemRestaurantNameLabel.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor).isActive = true
        itemRestaurantNameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        itemRestaurantNameLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 4).isActive = true
        itemRestaurantNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(starImage)
        starImage.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor).isActive = true
        starImage.topAnchor.constraint(equalTo: itemRestaurantNameLabel.bottomAnchor, constant: 4).isActive = true
        starImage.heightAnchor.constraint(equalToConstant: 18).isActive = true
        starImage.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        addSubview(itemRestaurantRatingLabel)
        itemRestaurantRatingLabel.leftAnchor.constraint(equalTo: starImage.rightAnchor).isActive = true
        itemRestaurantRatingLabel.topAnchor.constraint(equalTo: starImage.topAnchor).isActive = true
        itemRestaurantRatingLabel.heightAnchor.constraint(equalTo: starImage.heightAnchor, multiplier: 1).isActive = true
        itemRestaurantRatingLabel.widthAnchor.constraint(equalTo: itemRestaurantRatingLabel.heightAnchor, multiplier: 1.5).isActive = true
        
        addSubview(ratingCountLabel)
        ratingCountLabel.leftAnchor.constraint(equalTo: itemRestaurantRatingLabel.rightAnchor,constant: 4).isActive = true
        ratingCountLabel.topAnchor.constraint(equalTo: itemRestaurantRatingLabel.topAnchor).isActive = true
        ratingCountLabel.heightAnchor.constraint(equalTo: itemRestaurantRatingLabel.heightAnchor, multiplier: 1).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
