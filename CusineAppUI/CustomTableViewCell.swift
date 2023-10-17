//
//  CustomTableViewCell.swift
//  CusineAppUI
//
//  Created by Enes Kaya on 17.10.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    //Elementlerin scope'ları içinde UI tanımlamaları yapıldı
    
    
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
        label.font = UIFont.systemFont(ofSize: 16, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func addViews() {
        
        backgroundColor = .white
        addSubview(restaurentsLabel)
        addSubview(restaurentsRatingLabel)
        addSubview(restaurentsImageView)
        
        restaurentsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        restaurentsImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        //restaurentsImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        //restaurentsImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        restaurentsImageView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        restaurentsImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        restaurentsLabel.topAnchor.constraint(equalTo: restaurentsImageView.bottomAnchor, constant: 10).isActive = true
        restaurentsLabel.leftAnchor.constraint(equalTo: leftAnchor,constant: 10).isActive = true
        restaurentsLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        restaurentsRatingLabel.topAnchor.constraint(equalTo: restaurentsLabel.bottomAnchor, constant: 5).isActive = true
        restaurentsRatingLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        restaurentsRatingLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        
        
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
