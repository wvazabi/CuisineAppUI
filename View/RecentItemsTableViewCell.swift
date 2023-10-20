//
//  RecentItemsTableViewCell.swift
//  CusineAppUI
//
//  Created by Enes Kaya on 19.10.2023.
//

import Foundation

import UIKit


class RecentItemsTableViewCell: UITableViewCell {
    
    let recentItemImageview : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 7
        return imageView
    }()
    
    let recentItemNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let recentItemRestaurantNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let orangeStarIcon : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "orange_icon")
        imageView.tintColor = .orange
        return imageView
    }()
    
    let recentItemRestaurantRatingLabel : UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let recentItemRatingCountLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func addViews() {
        backgroundColor = .white
        
        addSubview(recentItemImageview)
        recentItemImageview.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        recentItemImageview.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        recentItemImageview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        recentItemImageview.widthAnchor.constraint(equalTo: recentItemImageview.heightAnchor, multiplier: 1).isActive = true
        
        addSubview(recentItemNameLabel)
        recentItemNameLabel.leftAnchor.constraint(equalTo: recentItemImageview.rightAnchor, constant: 16).isActive = true
        recentItemNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        recentItemNameLabel.topAnchor.constraint(equalTo: recentItemImageview.topAnchor).isActive = true
        recentItemNameLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(recentItemRestaurantNameLabel)
        recentItemRestaurantNameLabel.leftAnchor.constraint(equalTo: recentItemNameLabel.leftAnchor).isActive = true
        recentItemRestaurantNameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        recentItemRestaurantNameLabel.topAnchor.constraint(equalTo: recentItemNameLabel.bottomAnchor, constant: 4).isActive = true
        recentItemRestaurantNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(orangeStarIcon)
        orangeStarIcon.leftAnchor.constraint(equalTo: recentItemNameLabel.leftAnchor).isActive = true
        orangeStarIcon.topAnchor.constraint(equalTo: recentItemRestaurantNameLabel.bottomAnchor, constant: 4).isActive = true
        orangeStarIcon.heightAnchor.constraint(equalToConstant: 18).isActive = true
        orangeStarIcon.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        addSubview(recentItemRestaurantRatingLabel)
        recentItemRestaurantRatingLabel.leftAnchor.constraint(equalTo: orangeStarIcon.rightAnchor).isActive = true
        recentItemRestaurantRatingLabel.topAnchor.constraint(equalTo: orangeStarIcon.topAnchor).isActive = true
        recentItemRestaurantRatingLabel.heightAnchor.constraint(equalTo: orangeStarIcon.heightAnchor, multiplier: 1).isActive = true
        recentItemRestaurantRatingLabel.widthAnchor.constraint(equalTo: recentItemRestaurantRatingLabel.heightAnchor, multiplier: 1.5).isActive = true
        
        addSubview(recentItemRatingCountLabel)
        recentItemRatingCountLabel.leftAnchor.constraint(equalTo: recentItemRestaurantRatingLabel.rightAnchor,constant: 4).isActive = true
        recentItemRatingCountLabel.topAnchor.constraint(equalTo: recentItemRestaurantRatingLabel.topAnchor).isActive = true
        recentItemRatingCountLabel.heightAnchor.constraint(equalTo: recentItemRestaurantRatingLabel.heightAnchor, multiplier: 1).isActive = true
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
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
