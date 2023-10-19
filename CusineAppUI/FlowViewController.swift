import UIKit

class FlowViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate {
    
    var restaurents = [Restaurents]()
    var cuisine = [Cuisine]()
    var popularRestaurants = [Restaurents]()
    var recentItems = [RecentItemModel]()
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case popularTV:
            return popularRestaurants.count
        case recentTV:
            return recentItems.count
        default :
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case popularTV:
            let cell = tableView.dequeueReusableCell(withIdentifier: "popularTVCell", for: indexPath) as! PopularRestaurantsTableViewCell
           
            //cell.isHeroEnabled = true
            cell.restaurentsLabel.text = restaurents[indexPath.row].name
            cell.restaurentsRatingLabel.text = String(restaurents[indexPath.row].rate)
            cell.restaurentsImageView.image = UIImage(named: restaurents[indexPath.row].image)
            cell.restaurentCuisine.text = restaurents[indexPath.row].cuisine
            cell.commentLabel.text = "(4994 ratings)"
            
            
            return cell
            
        case recentTV:
            let cell = tableView.dequeueReusableCell(withIdentifier: "recentItemsCell", for: indexPath) as! RecentItemsTableViewCell
            //cell.isHeroEnabled = true

            cell.itemNameLabel.text = recentItems[indexPath.row].itemName
            cell.itemImageView.image = UIImage(named: recentItems[indexPath.row].itemImageName)
            cell.itemRestaurantNameLabel.text = "from \(recentItems[indexPath.row].itemRestaurant)"
            cell.itemRestaurantRatingLabel.text = "\(recentItems[indexPath.row].itemRestaurantRating)"
            cell.ratingCountLabel.text = "(\(recentItems[indexPath.row].ratingCount) ratings)"
            return cell
        default :
            return UITableViewCell()
        }
    }
    

    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.isScrollEnabled = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
//    private let deliveryOptionView : UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .white
//        view.heightAnchor.constraint(equalToConstant: 70).isActive = true
//        return view
//    }()
//    var deliveryButton = UIButton()
    
    private let searchView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "SearchBar")
        view.layer.cornerRadius = 25
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let popularTVView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 1400).isActive = true
        return view
    }()
    
    private let popularCVView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 270).isActive = true
        return view
    }()
    
    private let recentItemsView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 600).isActive = true
        return view
    }()
    
    var kitchensCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var popularTV = UITableView()
    var popularCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var recentTV = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcome()
        createUI()
        
        let minuteByTukTuk = Restaurents(name: "Minute By Tuk Tuk", rate: 4.9, cuisine: "(124 ratings)Cafe      Italy", image: "pizza", comment: 213)
        let cafeDeNoir = Restaurents(name: "Cafe De Noir", rate: 4.2, cuisine: "(280 ratings)Pub        English", image: "eng-breakfast", comment: 423)
        let bakesByTella = Restaurents(name: "Bakes by Tella", rate: 4.5, cuisine: "(1000 ratings)Bakery       Middle Earth", image: "bakery", comment: 432)
        
        let offer = Cuisine(name: "Offers", image: "offers")
        let srilanka = Cuisine(name: "Sri Lankan", image: "srilanka")
        let italian = Cuisine(name: "Italian", image: "italian")
        let indian = Cuisine(name: "Indian", image: "indian")
        let turkish = Cuisine(name: "Turkish", image: "turkish")
        let spanish = Cuisine(name: "Spanish", image: "spanish")
        
        let item1 = RecentItemModel(itemName: "Croissant Menu", itemRestaurant: "Uptown Bakery", itemImageName: "offers",
                                    itemRestaurantRating: 4.5, ratingCount: 94)
        let item2 = RecentItemModel(itemName: "Margherita Pizza", itemRestaurant: "New York Pizzeria", itemImageName: "srilanka",
                                    itemRestaurantRating: 4.1, ratingCount: 78)
        let item3 = RecentItemModel(itemName: "Double Spicy Taco", itemRestaurant: "Theo Taco", itemImageName: "italian",
                                    itemRestaurantRating: 4.5, ratingCount: 94)
        let item4 = RecentItemModel(itemName: "Dürüm with Ayran", itemRestaurant: "Merkez Döner", itemImageName: "turkish",
                                    itemRestaurantRating: 4.5, ratingCount: 94)
        let item5 = RecentItemModel(itemName: "Falafel Bowl", itemRestaurant: "Vegan World", itemImageName: "spanish",
                                    itemRestaurantRating: 4.5, ratingCount: 94)
        
        restaurents.append(minuteByTukTuk)
        restaurents.append(cafeDeNoir)
        restaurents.append(bakesByTella)
        
        popularRestaurants.append(minuteByTukTuk)
        popularRestaurants.append(cafeDeNoir)
        popularRestaurants.append(bakesByTella)
        
        
        recentItems.append(item1)
        recentItems.append(item2)
        recentItems.append(item3)
        recentItems.append(item4)
        recentItems.append(item5)
        
        cuisine.append(offer)
        cuisine.append(srilanka)
        cuisine.append(italian)
        cuisine.append(indian)
        cuisine.append(turkish)
        cuisine.append(spanish)
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: -8).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
//        stackView.addArrangedSubview(deliveryOptionView)
//        let deliveryLabel = UILabel()
//        deliveryLabel.translatesAutoresizingMaskIntoConstraints = false
//        deliveryLabel.text = "Delivering to"
//        deliveryLabel.textAlignment = .left
//        deliveryLabel.font = .init(name: "Metropolis-Regular", size: 16)
//        deliveryLabel.textColor = UIColor(named: "SecondaryFont")
//        deliveryLabel.numberOfLines = 1
//        deliveryOptionView.addSubview(deliveryLabel)
//        deliveryLabel.leadingAnchor.constraint(equalTo: deliveryOptionView.leadingAnchor, constant: 10).isActive = true
//        deliveryLabel.topAnchor.constraint(equalTo: deliveryOptionView.topAnchor, constant: 4).isActive = true
//        deliveryLabel.widthAnchor.constraint(equalTo: deliveryOptionView.widthAnchor, multiplier: 0.4).isActive = true
//
//        deliveryButton = UIButton(type: .system)
//        deliveryButton.translatesAutoresizingMaskIntoConstraints = false
//        deliveryButton.showsMenuAsPrimaryAction = true
//        deliveryButton.changesSelectionAsPrimaryAction = true
//        deliveryButton.menu = UIMenu(title: "Locations",
//                                     children: [UIAction(title: "Home",image: UIImage(systemName: "house.fill"), state: .on, handler: { action in
//            self.updateDeliveryButtonTitle(action.title)
//        }),
//                                                UIAction(title: "Work",image: UIImage(systemName: "briefcase.fill"), handler: { action in
//            self.updateDeliveryButtonTitle(action.title)
//        }),
//                                                UIAction(title: "Vacation Home",image: UIImage(systemName: "beach.umbrella.fill"), handler: { action in
//            self.updateDeliveryButtonTitle(action.title)
//        })])
//        deliveryButton.setTitle("Home ▼", for: .normal)
//
//        deliveryOptionView.addSubview(deliveryButton)
//        deliveryButton.leadingAnchor.constraint(equalTo: deliveryLabel.leadingAnchor).isActive = true
//        deliveryButton.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor,constant: 2).isActive = true
//
        stackView.addArrangedSubview(searchView)
        searchView.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 10).isActive = true
        searchView.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -10).isActive = true
        
        let searchImage = UIImageView()
        searchImage.translatesAutoresizingMaskIntoConstraints = false
        searchImage.image = UIImage()
        searchImage.image = UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate)
        searchImage.tintColor = .gray
        searchImage.contentMode = .scaleAspectFill
        searchView.addSubview(searchImage)
        searchImage.centerYAnchor.constraint(equalTo: searchView.centerYAnchor).isActive = true
        searchImage.leadingAnchor.constraint(equalTo: searchView.leadingAnchor,constant: 16).isActive = true
        searchImage.topAnchor.constraint(equalTo: searchView.topAnchor).isActive = true
        searchImage.bottomAnchor.constraint(equalTo: searchView.bottomAnchor,constant: -12).isActive = true
        searchImage.widthAnchor.constraint(equalTo: searchImage.heightAnchor, multiplier: 1).isActive = true
        
        
            
            let searchTF = UITextField()
            searchTF.translatesAutoresizingMaskIntoConstraints = false
            searchTF.attributedPlaceholder = NSAttributedString(
                string: "Search Food",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
            )

        
        searchTF.font = .systemFont(ofSize: 18)
        searchView.addSubview(searchTF)
        searchTF.leftAnchor.constraint(equalTo: searchImage.rightAnchor, constant: 8).isActive = true
        searchTF.rightAnchor.constraint(equalTo: searchView.rightAnchor, constant: -16).isActive = true
        searchTF.centerYAnchor.constraint(equalTo: searchView.centerYAnchor).isActive = true
        searchTF.heightAnchor.constraint(equalTo: searchView.heightAnchor,multiplier: 0.8).isActive = true
        
        //MARK: KITCHENS CV
        let kitchenCVLayout = UICollectionViewFlowLayout()
        kitchenCVLayout.itemSize = CGSize(width: view.frame.width / 3.5, height: 140)
        kitchenCVLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        kitchenCVLayout.minimumLineSpacing = 10
        kitchenCVLayout.minimumInteritemSpacing = 10
        kitchenCVLayout.scrollDirection = .horizontal
        kitchensCV = UICollectionView(frame: .zero, collectionViewLayout: kitchenCVLayout)
        kitchensCV.translatesAutoresizingMaskIntoConstraints = false
        kitchensCV.backgroundColor = .white
        kitchensCV.showsVerticalScrollIndicator = false
        kitchensCV.showsHorizontalScrollIndicator = false
        kitchensCV.delegate = self
        kitchensCV.dataSource = self
        kitchensCV.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "kitchenCell")
        stackView.addArrangedSubview(kitchensCV)
        kitchensCV.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        
        //MARK: RESTAURANTS TV
        stackView.addArrangedSubview(popularTVView)
        
        let popularLabel = UILabel()
        popularLabel.translatesAutoresizingMaskIntoConstraints = false
        popularLabel.text = "Popular Restaurants"
        popularLabel.textColor = UIColor(named: "PrimaryFont")
        popularLabel.font = .init(name: "Metropolis-ExtraBold", size: 22)
        popularLabel.textAlignment = .left
        //popularLabel.hero.id = "titleLabel"
        popularTVView.addSubview(popularLabel)
        popularLabel.leftAnchor.constraint(equalTo: popularTVView.leftAnchor, constant: 10).isActive = true
        popularLabel.topAnchor.constraint(equalTo: popularTVView.topAnchor, constant: 10).isActive = true
        popularLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        let viewAllLabel = UILabel()
        viewAllLabel.translatesAutoresizingMaskIntoConstraints = false
        viewAllLabel.text = "View All"
        viewAllLabel.textColor = UIColor(named:"AppOrange")
        viewAllLabel.font = .init(name: "Metropolis-Bold", size: 14)
        viewAllLabel.textAlignment = .right
        popularTVView.addSubview(viewAllLabel)
        viewAllLabel.centerYAnchor.constraint(equalTo: popularLabel.centerYAnchor).isActive = true
        viewAllLabel.rightAnchor.constraint(equalTo: popularTVView.rightAnchor, constant: -10).isActive = true
        
        popularTV.translatesAutoresizingMaskIntoConstraints = false
        popularTV.delegate = self
        popularTV.dataSource = self
        popularTV.backgroundColor = .white
        popularTV.isScrollEnabled = false
        popularTV.separatorColor  = .clear
        popularTV.register(PopularRestaurantsTableViewCell.self, forCellReuseIdentifier: "popularTVCell")
        popularTVView.addSubview(popularTV)
        popularTV.leftAnchor.constraint(equalTo: popularTVView.leftAnchor).isActive = true
        popularTV.rightAnchor.constraint(equalTo: popularTVView.rightAnchor).isActive = true
        popularTV.topAnchor.constraint(equalTo: popularLabel.bottomAnchor,constant: 10).isActive = true
        popularTV.bottomAnchor.constraint(equalTo: popularTVView.bottomAnchor).isActive = true
        popularTV.rowHeight = (1400-45) / 5
        
        //MARK: RESTAURANTS CV
        stackView.addArrangedSubview(popularCVView)
        
        let popularLabel2 = UILabel()
        popularLabel2.translatesAutoresizingMaskIntoConstraints = false
        popularLabel2.text = "Most Popular"
        popularLabel2.textColor = UIColor(named: "PrimaryFont")
        popularLabel2.font = .init(name: "Metropolis-ExtraBold", size: 22)
        popularLabel2.textAlignment = .left
        //popularLabel2.hero.id = "titleLabel"
        popularCVView.addSubview(popularLabel2)
        popularLabel2.leftAnchor.constraint(equalTo: popularCVView.leftAnchor, constant: 10).isActive = true
        popularLabel2.topAnchor.constraint(equalTo: popularCVView.topAnchor, constant: 10).isActive = true
        popularLabel2.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        let viewAllLabel2 = UILabel()
        viewAllLabel2.translatesAutoresizingMaskIntoConstraints = false
        viewAllLabel2.text = "View All"
        viewAllLabel2.textColor = UIColor(named:"AppOrange")
        viewAllLabel2.font = .init(name: "Metropolis-Bold", size: 14)
        viewAllLabel2.textAlignment = .right
        popularCVView.addSubview(viewAllLabel2)
        viewAllLabel2.centerYAnchor.constraint(equalTo: popularLabel2.centerYAnchor).isActive = true
        viewAllLabel2.rightAnchor.constraint(equalTo: popularCVView.rightAnchor, constant: -10).isActive = true
        
        let layout2 = UICollectionViewFlowLayout()
        layout2.itemSize = CGSize(width: view.frame.width * 0.6, height: 190)
        layout2.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout2.minimumLineSpacing = 20
        layout2.scrollDirection = .horizontal
        popularCV = UICollectionView(frame: .zero, collectionViewLayout: layout2)
        popularCV.translatesAutoresizingMaskIntoConstraints = false
        popularCV.backgroundColor = .white
        popularCV.showsVerticalScrollIndicator = false
        popularCV.showsHorizontalScrollIndicator = false
        popularCV.delegate = self
        popularCV.dataSource = self
        popularCV.register(MostPopularRestaurantCollectionViewCell.self, forCellWithReuseIdentifier: "popularCell")
        popularCVView.addSubview(popularCV)
        popularCV.leftAnchor.constraint(equalTo: popularCVView.leftAnchor).isActive = true
        popularCV.rightAnchor.constraint(equalTo: popularCVView.rightAnchor).isActive = true
        popularCV.topAnchor.constraint(equalTo: popularLabel2.bottomAnchor,constant: 10).isActive = true
        popularCV.bottomAnchor.constraint(equalTo: popularCVView.bottomAnchor).isActive = true
        
        //MARK: RECENT ITEMS TV
        stackView.addArrangedSubview(recentItemsView)
        
        let popularLabel3 = UILabel()
        popularLabel3.translatesAutoresizingMaskIntoConstraints = false
        popularLabel3.text = "Recent Items"
        popularLabel3.textColor = UIColor(named: "PrimaryFont")
        popularLabel3.font = .init(name: "Metropolis-ExtraBold", size: 22)
        popularLabel3.textAlignment = .left
        //popularLabel3.hero.id = "titleLabel"
        recentItemsView.addSubview(popularLabel3)
        popularLabel3.leftAnchor.constraint(equalTo: recentItemsView.leftAnchor, constant: 10).isActive = true
        popularLabel3.topAnchor.constraint(equalTo: recentItemsView.topAnchor, constant: 10).isActive = true
        popularLabel3.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        let viewAllLabel3 = UILabel()
        viewAllLabel3.translatesAutoresizingMaskIntoConstraints = false
        viewAllLabel3.text = "View All"
        viewAllLabel3.textColor = UIColor(named:"AppOrange")
        viewAllLabel3.font = .init(name: "Metropolis-Bold", size: 14)
        viewAllLabel3.textAlignment = .right
        recentItemsView.addSubview(viewAllLabel3)
        viewAllLabel3.centerYAnchor.constraint(equalTo: popularLabel3.centerYAnchor).isActive = true
        viewAllLabel3.rightAnchor.constraint(equalTo: recentItemsView.rightAnchor, constant: -10).isActive = true
        
        recentTV.translatesAutoresizingMaskIntoConstraints = false
        recentTV.delegate = self
        recentTV.dataSource = self
        recentTV.backgroundColor = .white
        recentTV.isScrollEnabled = false
        recentTV.separatorColor  = .clear
        recentTV.register(RecentItemsTableViewCell.self, forCellReuseIdentifier: "recentItemsCell")
        recentItemsView.addSubview(recentTV)
        recentTV.leftAnchor.constraint(equalTo: recentItemsView.leftAnchor).isActive = true
        recentTV.rightAnchor.constraint(equalTo: recentItemsView.rightAnchor).isActive = true
        recentTV.topAnchor.constraint(equalTo: popularLabel3.bottomAnchor,constant: 10).isActive = true
        recentTV.bottomAnchor.constraint(equalTo: recentItemsView.bottomAnchor).isActive = true
        recentTV.rowHeight = (600-45) / 5
        
    }
    
    
    
   
    
    func welcome() {
        // Uygulama yüklendiğinde otomatik olarak çağrılan işlev
        view.backgroundColor = .white
        let titleLabel = UILabel()
        let alertController = UIAlertController(title: "What is your name", message: nil, preferredStyle: .alert)

        // Textfield ekleme
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Your Name"
        }

        // "Tamam" eylemini oluşturun
        let okAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            if let textField = alertController.textFields?.first, let name = textField.text {
                // Kullanıcının girdiği ismi alın ve Navigation Bar başlığını güncelleyin

                let greeting = self.getGreetingBasedOnTime()
                titleLabel.text = "\(greeting) \(name)!"
                self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            }
        }
        alertController.addAction(okAction)

        // UIAlertController'ı gösterin
        present(alertController, animated: true, completion: nil)

        let customNavigationView = UIView()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        titleLabel.textColor = UIColor.black
        customNavigationView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: customNavigationView.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: customNavigationView.leftAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: customNavigationView.bottomAnchor).isActive = true
        titleLabel.textAlignment = .left
        navigationItem.titleView = customNavigationView
    }

    func getGreetingBasedOnTime() -> String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: Date())
        
        if 6...11 ~= hour {
            return "Good Morning"
        } else if 12...17 ~= hour {
            return "Good Afternoon"
        } else {
            return "Good Evening"
        }
    }

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case kitchensCV :
            return cuisine.count
        case popularCV :
            return popularRestaurants.count
        default :
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case kitchensCV :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kitchenCell", for: indexPath) as! SearchCollectionViewCell
            
            cell.cuisineLabel.text = cuisine[indexPath.row].name
            cell.cuisineImageView.image = UIImage(named: cuisine[indexPath.row].image)
            return cell
            
        case popularCV :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as! MostPopularRestaurantCollectionViewCell
            //cell.isHeroEnabled = true
            
            cell.nameLabel.text = popularRestaurants[indexPath.row].name
            cell.restaurantImageView.image = UIImage(named: popularRestaurants[indexPath.row].image)
            cell.typeLabel.text = popularRestaurants[indexPath.row].cuisine
            cell.ratingLabel.text = "\(popularRestaurants.count)"
            return cell
        default :
            return UICollectionViewCell()
        }
    }
    
    
}

