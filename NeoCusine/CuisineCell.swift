import UIKit

class CuisineCell: UICollectionViewCell {
    
    var cuisineImageView: UIImageView!
    var cuisineLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cuisineImageView = UIImageView()
        cuisineImageView.backgroundColor = .clear
        cuisineImageView.layer.cornerRadius = cuisineImageView.frame.size.width / 2
        cuisineImageView.layer.masksToBounds = true
        cuisineImageView.clipsToBounds = true
        cuisineImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cuisineImageView)
        
        cuisineLabel = UILabel()
        cuisineLabel.textColor = .black
        cuisineLabel.textAlignment = .center
        cuisineLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        cuisineLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cuisineLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Hücreyi Cuisine verileriyle yapılandırmak için kullanılır
    func configure(with cuisine: Cuisine) {
        cuisineImageView.image = UIImage(named: cuisine.image)
        cuisineLabel.text = cuisine.name
    }
    
    private func setupConstraints() {
        // Görünümünüzün yerleşimi (constraint'leri) burada ekleyebilirsiniz
        // Örnek olarak, cuisineImageView ve cuisineLabel görünümlerinin konumlandırılması
        cuisineImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        cuisineImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        cuisineImageView.widthAnchor.constraint(equalToConstant: 125).isActive = true
        cuisineImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        cuisineLabel.topAnchor.constraint(equalTo: cuisineImageView.bottomAnchor, constant: 10).isActive = true
        cuisineLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        cuisineLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
}
