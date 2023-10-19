//
//  MostPopularRestaurantCollectionViewCell.swift
//  CusineAppUI
//
//  Created by Enes Kaya on 19.10.2023.
//




import UIKit


class MostPopularRestaurantCollectionViewCell: UICollectionViewCell {
    
    let restaurantImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.textAlignment = .left
        //view.font = UIFont(name: .defaultCStringEncoding, size: <#T##CGFloat#>)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let typeLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.textAlignment = .left
        //view.font = .init(name: "Metropolis-Medium", size: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.hero.id = "secondaryLabel"
        return view
    }()
    
    let starImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(systemName: "orange_icon")?.withRenderingMode(.alwaysTemplate)
        view.tintColor = .orange
        //view.hero.id = "starImage"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let ratingLabel: UILabel = {
        let view = UILabel()
        view.textColor = .orange
        view.textAlignment = .left
        //view.font = .init(name: "Metropolis-Regular", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.hero.id = "ratingLabel"
        return view
    }()
    
    private func configureViews() {
        backgroundColor = .white
        
        addSubview(restaurantImageView)
        restaurantImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        restaurantImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        restaurantImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        restaurantImageView.heightAnchor.constraint(equalTo: restaurantImageView.widthAnchor, multiplier: 0.5).isActive = true
        
        addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: restaurantImageView.bottomAnchor, constant: 4).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(typeLabel)
        typeLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
        typeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        typeLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        
        addSubview(starImageView)
        starImageView.leftAnchor.constraint(equalTo: typeLabel.rightAnchor, constant: 10).isActive = true
        starImageView.centerYAnchor.constraint(equalTo: typeLabel.centerYAnchor).isActive = true
        starImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        starImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        addSubview(ratingLabel)
        ratingLabel.leftAnchor.constraint(equalTo: starImageView.rightAnchor).isActive = true
        ratingLabel.topAnchor.constraint(equalTo: starImageView.topAnchor).isActive = true
        ratingLabel.heightAnchor.constraint(equalTo: starImageView.heightAnchor, multiplier: 1).isActive = true
        ratingLabel.widthAnchor.constraint(equalTo: ratingLabel.heightAnchor, multiplier: 1.5).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
