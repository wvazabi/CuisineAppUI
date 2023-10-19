import UIKit

class LabelCell: UICollectionViewCell {
  static let reuseIdentifier = "labelCell"
  
  public lazy var textLabel: UILabel = {
      let label = UILabel()
      label.textColor = .black
      label.textAlignment = .left
      label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
      
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
  }()
    
    let cuisineImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    textLabelConstraints()
  }
  
  private func textLabelConstraints() {
   
    
      
      
      backgroundColor = .white
      addSubview(cuisineImageView)
      addSubview(textLabel)
      
      cuisineImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
      cuisineImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
      //restaurentsImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
      //restaurentsImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
      cuisineImageView.widthAnchor.constraint(equalToConstant: 125).isActive = true
      cuisineImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
      
      textLabel.topAnchor.constraint(equalTo: cuisineImageView.bottomAnchor, constant: 10).isActive = true
      textLabel.leftAnchor.constraint(equalTo: leftAnchor,constant: 5).isActive = true
      textLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
      
  }
}
