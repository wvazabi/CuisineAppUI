import UIKit

class ViewController: UIViewController,  UICollectionViewDelegate, UICollectionViewDataSource {
    
    let restaurentsTableView = UITableView()
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var restaurents = [Restaurents]()
    var cuisine = [Cuisine]()
    var headerView: UIView?
    var headerHeight: CGFloat = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        restaurentsTableView.delegate = self
//        restaurentsTableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        setupUI()

        // Restoran verilerini ekleyin (örnek veriler)
        let minuteByTukTuk = Restaurents(name: "Minute By Tuk Tuk", rate: 4.9, cuisine: "(124 ratings)Cafe      Italy", image: "pizza")
        let cafeDeNoir = Restaurents(name: "Cafe De Noir", rate: 4.2, cuisine: "(280 ratings)Pub        English", image: "eng-breakfast")
        let bakesByTella = Restaurents(name: "Bakes by Tella", rate: 4.5, cuisine: "(1000 ratings)Bakery       Middle Earth", image: "bakery")
        
        let offer = Cuisine(name: "Offers", image: "offers")
        let srilanka = Cuisine(name: "Sri Lankan", image: "srilanka")
        let italian = Cuisine(name: "Italian", image: "italian")
        let indian = Cuisine(name: "Indian", image: "indian")
        let turkish = Cuisine(name: "Turkish", image: "turkish")
        let spanish = Cuisine(name: "Spanish", image: "spanish")
        

        restaurents.append(minuteByTukTuk)
        restaurents.append(cafeDeNoir)
        restaurents.append(bakesByTella)
    
        cuisine.append(offer)
        cuisine.append(srilanka)
        cuisine.append(italian)
        cuisine.append(indian)
        cuisine.append(turkish)
        cuisine.append(spanish)
        
    }

    private func setupUI() {
        
//        restaurentsTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        
        // TableView Constraints
//        view.addSubview(restaurentsTableView)
//        restaurentsTableView.translatesAutoresizingMaskIntoConstraints = false
//        restaurentsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        restaurentsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        restaurentsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        restaurentsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // CollectionView Constraints
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
   
        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true // Koleksiyon görünümünün yüksekliğini 200 olarak ayarlayın

        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.sectionInset = UIEdgeInsets(top: 50, left: 25, bottom: 20, right: 25)
            layout.itemSize = CGSize(width: 125, height: 150)
        }
        collectionView.isPagingEnabled = true
    }

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return restaurents.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
//        cell.restaurentsLabel.text = restaurents[indexPath.row].name
//        cell.restaurentsRatingLabel.text = String(restaurents[indexPath.row].rate)
//        cell.restaurentsImageView.image = UIImage(named: restaurents[indexPath.row].image)
//        cell.restaurentCuisine.text = restaurents[indexPath.row].cuisine
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 380
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if headerView == nil {
//            headerView = UIView()
//            headerView?.backgroundColor = UIColor.white // Başlık arka plan rengi
//
//            let whiteBackgroundView = UIView()
//            whiteBackgroundView.backgroundColor = UIColor.white
//            whiteBackgroundView.translatesAutoresizingMaskIntoConstraints = false
//            headerView?.addSubview(whiteBackgroundView)
//
//            let viewAllButton: UIButton = {
//                let button = UIButton()
//                button.setTitle("View all", for: .normal)
//                button.setTitleColor(UIColor.orange, for: .normal)
//                button.translatesAutoresizingMaskIntoConstraints = false
//                return button
//            }()
//
//            let label = UILabel()
//            label.text = "Popular Restaurents"
//            label.textColor = UIColor.black
//            label.font = UIFont.boldSystemFont(ofSize: 24)
//            label.translatesAutoresizingMaskIntoConstraints = false
//
//            headerView?.addSubview(label)
//            headerView?.addSubview(viewAllButton)
//
//            NSLayoutConstraint.activate([
//                whiteBackgroundView.topAnchor.constraint(equalTo: label.topAnchor, constant: -10),
//                whiteBackgroundView.leadingAnchor.constraint(equalTo: headerView!.leadingAnchor),
//                whiteBackgroundView.trailingAnchor.constraint(equalTo: headerView!.trailingAnchor),
//                whiteBackgroundView.bottomAnchor.constraint(equalTo: headerView!.bottomAnchor),
//                label.leadingAnchor.constraint(equalTo: headerView!.leadingAnchor, constant: 10),
//                label.centerYAnchor.constraint(equalTo: headerView!.centerYAnchor),
//                viewAllButton.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 80),
//                viewAllButton.centerYAnchor.constraint(equalTo: headerView!.centerYAnchor)
//            ])
//
//            headerView?.backgroundColor = .white
//        }
//
//        return headerView
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cuisine.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CustomCollectionViewCell
        
        cell.cuisineLabel.text = cuisine[indexPath.row].name
        cell.cuisineImageView.image = UIImage(named: cuisine[indexPath.row].image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150) // Hücre yüksekliğini 150 yerine daha küçük bir değere ayarlayın
    }
   

}

