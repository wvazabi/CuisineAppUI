import UIKit

class HorizontalCollectionViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    var cuisine = [Cuisine]()
    
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
        
        cuisineImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        cuisineImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //restaurentsImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        //restaurentsImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        cuisineImageView.widthAnchor.constraint(equalToConstant: 125).isActive = true
        cuisineImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        cuisineLabel.topAnchor.constraint(equalTo: cuisineImageView.bottomAnchor, constant: 10).isActive = true
        cuisineLabel.leftAnchor.constraint(equalTo: leftAnchor,constant: 5).isActive = true
        cuisineLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
       
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        layout.sectionInset = UIEdgeInsets(top: 50, left: 25, bottom: 20, right: 25)
        layout.itemSize = CGSize(width: 125, height: 150)
                
        
        collectionView = UICollectionView(frame: contentView.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CuisineCell.self, forCellWithReuseIdentifier: "horizontalCollectionCell")
        contentView.addSubview(collectionView)
        
        let offer = Cuisine(name: "Offers", image: "offers")
        let srilanka = Cuisine(name: "Sri Lankan", image: "srilanka")
        let italian = Cuisine(name: "Italian", image: "italian")
        let indian = Cuisine(name: "Indian", image: "indian")
        let turkish = Cuisine(name: "Turkish", image: "turkish")
        let spanish = Cuisine(name: "Spanish", image: "spanish")
        
        
        cuisine.append(offer)
        cuisine.append(srilanka)
        cuisine.append(italian)
        cuisine.append(indian)
        cuisine.append(turkish)
        cuisine.append(spanish)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Collection View için verileri doldur
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cuisine.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "horizontalCollectionCell", for: indexPath) as! CuisineCell
        let cuisine = cuisine[indexPath.item]
        cell.configure(with: cuisine)
        return cell
    }
    
    // Cuisine hücrelerini güncellemek için bir işlev ekleyin
    func configure(with cuisines: [Cuisine]) {
        self.cuisine = cuisines
        collectionView.reloadData()
    }
}
