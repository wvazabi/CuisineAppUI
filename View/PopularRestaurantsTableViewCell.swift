//
//  PopularRestaurantsTableCell.swift
//  CusineAppUI
//
//  Created by Enes Kaya on 19.10.2023.
//

import UIKit

class PopularRestaurantsTableViewCell: UITableViewCell {
    
    
    let restaurentsImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
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
           imageView.image = UIImage(named: "orange_icon")
           imageView.contentMode = .scaleAspectFit
           imageView.translatesAutoresizingMaskIntoConstraints = false
           return imageView
       }()
    
   
    
    let commentLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func addViews() {
        
        backgroundColor = .white
        
        
        addSubview(restaurentsImageView)
        restaurentsImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        restaurentsImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        restaurentsImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        restaurentsImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.65).isActive = true
        
        addSubview(restaurentsLabel)
        restaurentsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        restaurentsLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        restaurentsLabel.topAnchor.constraint(equalTo: restaurentsImageView.bottomAnchor, constant: 4).isActive = true
        restaurentsLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(restaurentCuisine)
        restaurentCuisine.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        restaurentCuisine.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        restaurentCuisine.topAnchor.constraint(equalTo: restaurentsLabel.bottomAnchor, constant: 4).isActive = true
        restaurentCuisine.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(orangeIconImageView)
        orangeIconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        orangeIconImageView.topAnchor.constraint(equalTo: restaurentCuisine.bottomAnchor, constant: 4).isActive = true
        orangeIconImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        orangeIconImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        addSubview(restaurentsRatingLabel)
        restaurentsRatingLabel.leftAnchor.constraint(equalTo: orangeIconImageView.rightAnchor).isActive = true
        restaurentsRatingLabel.topAnchor.constraint(equalTo: orangeIconImageView.topAnchor).isActive = true
        restaurentsRatingLabel.heightAnchor.constraint(equalTo: orangeIconImageView.heightAnchor, multiplier: 1).isActive = true
        restaurentsRatingLabel.widthAnchor.constraint(equalTo: restaurentsRatingLabel.heightAnchor, multiplier: 1.5).isActive = true
        
        addSubview(commentLabel)
        commentLabel.leftAnchor.constraint(equalTo: restaurentsRatingLabel.rightAnchor,constant: 4).isActive = true
        commentLabel.topAnchor.constraint(equalTo: restaurentsRatingLabel.topAnchor).isActive = true
        commentLabel.heightAnchor.constraint(equalTo: restaurentsRatingLabel.heightAnchor, multiplier: 1).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    


}
