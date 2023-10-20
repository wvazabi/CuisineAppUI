import UIKit

class FlowViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate {
    
    var restaurents = [Restaurents]()
    var cuisine = [Cuisine]()
    var popularRestaurants = [Restaurents]()
    var recentItems = [RecentItems]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case restaurantsTableView:
            return popularRestaurants.count
        case recentItemTableView:
            return recentItems.count
        default :
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case restaurantsTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantsTableViewCell", for: indexPath) as! PopularRestaurantsTableViewCell
            
            cell.restaurentsLabel.text = restaurents[indexPath.row].name
            cell.restaurentsRatingLabel.text = String(restaurents[indexPath.row].rate)
            cell.restaurentsImageView.image = UIImage(named: restaurents[indexPath.row].image)
            cell.restaurentCuisine.text = restaurents[indexPath.row].cuisine
            cell.commentLabel.text = "\(restaurents[indexPath.row].comment)"
            
            return cell
            
        case recentItemTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "recentItemsTableViewCell", for: indexPath) as! RecentItemsTableViewCell
            
            cell.recentItemNameLabel.text = recentItems[indexPath.row].itemName
            cell.recentItemImageview.image = UIImage(named: recentItems[indexPath.row].itemImageName)
            cell.recentItemRestaurantNameLabel.text = "from \(recentItems[indexPath.row].itemRestaurant)"
            cell.recentItemRestaurantRatingLabel.text = "\(recentItems[indexPath.row].itemRestaurantRating)"
            cell.recentItemRatingCountLabel.text = "(\(recentItems[indexPath.row].ratingCount) ratings)"
            return cell
        default :
            return UITableViewCell()
        }
    }
    
    
    private let flowScrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.isScrollEnabled = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private let flowStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    
    private let flowSearchView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "SearchBar")
        view.layer.cornerRadius = 28
        view.heightAnchor.constraint(equalToConstant: 45).isActive = true
        return view
    }()
    
    private let popularRestaurantsTableViewView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 1100).isActive = true
        return view
    }()
    
    private let mostPopularCollectionViewView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 280).isActive = true
        return view
    }()
    
    private let recentItemsTableViewView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 580).isActive = true
        return view
    }()
    
    var searchMenuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var restaurantsTableView = UITableView()
    var mostPopularCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var recentItemTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcome()
        createUI()
        
        let minuteByTukTuk = Restaurents(name: "Minute By Tuk Tuk", rate: 4.9, cuisine: "Cafe - Italy", image: "popularPizza", comment: 213)
        let cafeDeNoir = Restaurents(name: "Cafe De Noir", rate: 4.2, cuisine: "Pub - English", image: "popularBreakfast", comment: 423)
        let bakesByTella = Restaurents(name: "Bakes by Tella", rate: 4.5, cuisine: "Bakery - Middle Earth", image: "popularCroissant", comment: 432)
        let susi = Restaurents(name: "Kakashi", rate: 5, cuisine: "Japanese - Food", image: "popularSusi", comment: 2372)
        let lasagna = Restaurents(name: "Buesnos Diaz", rate: 4.5, cuisine: "Little Italy", image: "popularlasagna", comment: 432)
        
        let offer = Cuisine(name: "Offers", image: "offers")
        let srilanka = Cuisine(name: "Sri Lankan", image: "srilanka")
        let italian = Cuisine(name: "Italian", image: "italian")
        let indian = Cuisine(name: "Indian", image: "indian")
        let turkish = Cuisine(name: "Turkish", image: "turkish")
        let spanish = Cuisine(name: "Spanish", image: "spanish")
        
        let mPizza = RecentItems(itemName: "Mulberry Pizza by Josh", itemRestaurant: "Cafe - Italy ", itemImageName: "recentPizza",
                                 itemRestaurantRating: 4.9, ratingCount: 124)
        let coffe = RecentItems(itemName: "Barita", itemRestaurant: "Cafe - France", itemImageName: "recentCafe",
                                itemRestaurantRating: 3.9, ratingCount: 689)
        let pizzaRush = RecentItems(itemName: "Pizza Rush Hour", itemRestaurant: "Restaurant - Italy", itemImageName: "recentPizza2",
                                    itemRestaurantRating: 4.3, ratingCount: 884)
        let cornDogs = RecentItems(itemName: "Austin BBQ", itemRestaurant: "Street Food - USA", itemImageName: "recentCornDogs",
                                   itemRestaurantRating: 4.5, ratingCount: 94)
        let halal = RecentItems(itemName: "Halal Guys", itemRestaurant: "Street Food - NYC", itemImageName: "recentHalal",
                                itemRestaurantRating: 4.5, ratingCount: 94)
        
        
        
        let bambaa = Restaurents(name: "Café De Bambaa", rate: 4.2, cuisine: "Cafe - Italy", image: "mostPopularPizza", comment: 645)
        let borris = Restaurents(name: "Burger by Borris", rate: 3.1, cuisine: "Pub-English", image: "mostPopularBlueBery", comment: 83)
        let wagyu = Restaurents(name: "Tokya Fire", rate: 4.8, cuisine: "Legend", image: "mostPopularWagyu", comment: 4342)
        let deep = Restaurents(name: "Deep Pizza", rate: 5, cuisine: "Legend - USA ", image: "deep", comment: 6342)
        
        
        restaurents.append(minuteByTukTuk)
        restaurents.append(cafeDeNoir)
        restaurents.append(bakesByTella)
        restaurents.append(lasagna)
        restaurents.append(susi)
        
        
        popularRestaurants.append(bambaa)
        popularRestaurants.append(borris)
        popularRestaurants.append(wagyu)
        popularRestaurants.append(deep)
        
        
        recentItems.append(mPizza)
        recentItems.append(coffe)
        recentItems.append(pizzaRush)
        recentItems.append(cornDogs)
        recentItems.append(halal)
        
        cuisine.append(offer)
        cuisine.append(srilanka)
        cuisine.append(italian)
        cuisine.append(indian)
        cuisine.append(turkish)
        cuisine.append(spanish)
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        view.addSubview(flowScrollView)
        flowScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        flowScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        flowScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        flowScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        flowScrollView.addSubview(flowStackView)
        flowStackView.topAnchor.constraint(equalTo: flowScrollView.topAnchor,constant: 16).isActive = true
        flowStackView.leadingAnchor.constraint(equalTo: flowScrollView.leadingAnchor).isActive = true
        flowStackView.trailingAnchor.constraint(equalTo: flowScrollView.trailingAnchor).isActive = true
        flowStackView.bottomAnchor.constraint(equalTo: flowScrollView.bottomAnchor,constant: -8).isActive = true
        flowStackView.widthAnchor.constraint(equalTo: flowScrollView.widthAnchor).isActive = true
        flowStackView.addArrangedSubview(flowSearchView)
        flowSearchView.leftAnchor.constraint(equalTo: flowStackView.leftAnchor, constant: 10).isActive = true
        flowSearchView.rightAnchor.constraint(equalTo: flowStackView.rightAnchor, constant: -10).isActive = true
        
        let searchBarIcon = UIImageView()
        searchBarIcon.translatesAutoresizingMaskIntoConstraints = false
        searchBarIcon.image = UIImage()
        searchBarIcon.image = UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate)
        searchBarIcon.tintColor = .gray
        searchBarIcon.contentMode = .scaleAspectFill
        flowSearchView.addSubview(searchBarIcon)
        searchBarIcon.centerYAnchor.constraint(equalTo: flowSearchView.centerYAnchor).isActive = true
        searchBarIcon.leadingAnchor.constraint(equalTo: flowSearchView.leadingAnchor,constant: 16).isActive = true
        searchBarIcon.topAnchor.constraint(equalTo: flowSearchView.topAnchor).isActive = true
        searchBarIcon.bottomAnchor.constraint(equalTo: flowSearchView.bottomAnchor,constant: -12).isActive = true
        searchBarIcon.widthAnchor.constraint(equalTo: searchBarIcon.heightAnchor, multiplier: 1).isActive = true
        
        
        
        let searchBarTextField = UITextField()
        searchBarTextField.translatesAutoresizingMaskIntoConstraints = false
        searchBarTextField.attributedPlaceholder = NSAttributedString(
            string: "Search Food",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        
        
        searchBarTextField.font = .systemFont(ofSize: 18)
        flowSearchView.addSubview(searchBarTextField)
        searchBarTextField.leftAnchor.constraint(equalTo: searchBarIcon.rightAnchor, constant: 8).isActive = true
        searchBarTextField.rightAnchor.constraint(equalTo: flowSearchView.rightAnchor, constant: -16).isActive = true
        searchBarTextField.centerYAnchor.constraint(equalTo: flowSearchView.centerYAnchor).isActive = true
        searchBarTextField.heightAnchor.constraint(equalTo: flowSearchView.heightAnchor,multiplier: 0.8).isActive = true
        
        
        let searchCollectionViewLayout = UICollectionViewFlowLayout()
        searchCollectionViewLayout.itemSize = CGSize(width: view.frame.width / 3.5, height: 140)
        searchCollectionViewLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        searchCollectionViewLayout.minimumLineSpacing = 10
        searchCollectionViewLayout.minimumInteritemSpacing = 10
        searchCollectionViewLayout.scrollDirection = .horizontal
        searchMenuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: searchCollectionViewLayout)
        searchMenuCollectionView.translatesAutoresizingMaskIntoConstraints = false
        searchMenuCollectionView.backgroundColor = .white
        searchMenuCollectionView.showsVerticalScrollIndicator = false
        searchMenuCollectionView.showsHorizontalScrollIndicator = false
        searchMenuCollectionView.delegate = self
        searchMenuCollectionView.dataSource = self
        searchMenuCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "searchCell")
        flowStackView.addArrangedSubview(searchMenuCollectionView)
        searchMenuCollectionView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        
        
        flowStackView.addArrangedSubview(popularRestaurantsTableViewView)
        
        let popularRestaurantLabel = UILabel()
        popularRestaurantLabel.translatesAutoresizingMaskIntoConstraints = false
        popularRestaurantLabel.text = "Popular Restaurants"
        popularRestaurantLabel.textColor = .black
        popularRestaurantLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        popularRestaurantLabel.textAlignment = .left
        popularRestaurantsTableViewView.addSubview(popularRestaurantLabel)
        popularRestaurantLabel.leftAnchor.constraint(equalTo: popularRestaurantsTableViewView.leftAnchor, constant: 10).isActive = true
        popularRestaurantLabel.topAnchor.constraint(equalTo: popularRestaurantsTableViewView.topAnchor, constant: 10).isActive = true
        popularRestaurantLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        let viewAllLabel = UILabel()
        viewAllLabel.translatesAutoresizingMaskIntoConstraints = false
        viewAllLabel.text = "View All"
        viewAllLabel.textColor = .orange
        viewAllLabel.textAlignment = .right
        popularRestaurantsTableViewView.addSubview(viewAllLabel)
        viewAllLabel.centerYAnchor.constraint(equalTo: popularRestaurantLabel.centerYAnchor).isActive = true
        viewAllLabel.rightAnchor.constraint(equalTo: popularRestaurantsTableViewView.rightAnchor, constant: -10).isActive = true
        
        restaurantsTableView.translatesAutoresizingMaskIntoConstraints = false
        restaurantsTableView.delegate = self
        restaurantsTableView.dataSource = self
        restaurantsTableView.backgroundColor = .white
        restaurantsTableView.isScrollEnabled = false
        restaurantsTableView.separatorColor  = .clear
        restaurantsTableView.register(PopularRestaurantsTableViewCell.self, forCellReuseIdentifier: "restaurantsTableViewCell")
        popularRestaurantsTableViewView.addSubview(restaurantsTableView)
        restaurantsTableView.leftAnchor.constraint(equalTo: popularRestaurantsTableViewView.leftAnchor).isActive = true
        restaurantsTableView.rightAnchor.constraint(equalTo: popularRestaurantsTableViewView.rightAnchor).isActive = true
        restaurantsTableView.topAnchor.constraint(equalTo: popularRestaurantLabel.bottomAnchor,constant: 10).isActive = true
        restaurantsTableView.bottomAnchor.constraint(equalTo: popularRestaurantsTableViewView.bottomAnchor).isActive = true
        restaurantsTableView.rowHeight = 265
        
        flowStackView.addArrangedSubview(mostPopularCollectionViewView)
        
        let mostPopularLabel = UILabel()
        mostPopularLabel.translatesAutoresizingMaskIntoConstraints = false
        mostPopularLabel.text = "Most Popular"
        mostPopularLabel.textColor = .black
        mostPopularLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        mostPopularLabel.textAlignment = .left
        
        mostPopularCollectionViewView.addSubview(mostPopularLabel)
        mostPopularLabel.leftAnchor.constraint(equalTo: mostPopularCollectionViewView.leftAnchor, constant: 10).isActive = true
        mostPopularLabel.topAnchor.constraint(equalTo: mostPopularCollectionViewView.topAnchor).isActive = true
        mostPopularLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        let viewAllOrangeButton = UILabel()
        viewAllOrangeButton.translatesAutoresizingMaskIntoConstraints = false
        viewAllOrangeButton.text = "View All"
        viewAllOrangeButton.textColor = .orange
        viewAllOrangeButton.textAlignment = .right
        viewAllOrangeButton.font = UIFont.systemFont(ofSize: 18)
        mostPopularCollectionViewView.addSubview(viewAllOrangeButton)
        viewAllOrangeButton.centerYAnchor.constraint(equalTo: mostPopularLabel.centerYAnchor).isActive = true
        viewAllOrangeButton.rightAnchor.constraint(equalTo: mostPopularCollectionViewView.rightAnchor, constant: -10).isActive = true
        
        let collectionViewCustomLayout = UICollectionViewFlowLayout()
        collectionViewCustomLayout.itemSize = CGSize(width: view.frame.width * 0.6, height: 190)
        collectionViewCustomLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionViewCustomLayout.minimumLineSpacing = 20
        collectionViewCustomLayout.scrollDirection = .horizontal
        mostPopularCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewCustomLayout)
        mostPopularCollectionView.translatesAutoresizingMaskIntoConstraints = false
        mostPopularCollectionView.backgroundColor = .white
        mostPopularCollectionView.showsVerticalScrollIndicator = false
        mostPopularCollectionView.showsHorizontalScrollIndicator = false
        mostPopularCollectionView.delegate = self
        mostPopularCollectionView.dataSource = self
        mostPopularCollectionView.register(MostPopularRestaurantCollectionViewCell.self, forCellWithReuseIdentifier: "popularCell")
        mostPopularCollectionViewView.addSubview(mostPopularCollectionView)
        mostPopularCollectionView.leftAnchor.constraint(equalTo: mostPopularCollectionViewView.leftAnchor).isActive = true
        mostPopularCollectionView.rightAnchor.constraint(equalTo: mostPopularCollectionViewView.rightAnchor).isActive = true
        mostPopularCollectionView.topAnchor.constraint(equalTo: mostPopularLabel.bottomAnchor,constant: 10).isActive = true
        mostPopularCollectionView.bottomAnchor.constraint(equalTo: mostPopularCollectionViewView.bottomAnchor).isActive = true
        
        flowStackView.addArrangedSubview(recentItemsTableViewView)
        
        let recentItemsLabel = UILabel()
        recentItemsLabel.translatesAutoresizingMaskIntoConstraints = false
        recentItemsLabel.text = "Recent Items"
        recentItemsLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        recentItemsLabel.textColor = .black
        recentItemsLabel.textAlignment = .left
        
        recentItemsTableViewView.addSubview(recentItemsLabel)
        recentItemsLabel.leftAnchor.constraint(equalTo: recentItemsTableViewView.leftAnchor, constant: 10).isActive = true
        recentItemsLabel.topAnchor.constraint(equalTo: recentItemsTableViewView.topAnchor, constant: 10).isActive = true
        recentItemsLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        let viewallbuttonorange = UILabel()
        viewallbuttonorange.translatesAutoresizingMaskIntoConstraints = false
        viewallbuttonorange.text = "View All"
        viewallbuttonorange.textColor = .orange
        viewallbuttonorange.textAlignment = .right
        recentItemsTableViewView.addSubview(viewallbuttonorange)
        viewallbuttonorange.centerYAnchor.constraint(equalTo: recentItemsLabel.centerYAnchor).isActive = true
        viewallbuttonorange.rightAnchor.constraint(equalTo: recentItemsTableViewView.rightAnchor, constant: -10).isActive = true
        
        recentItemTableView.translatesAutoresizingMaskIntoConstraints = false
        recentItemTableView.delegate = self
        recentItemTableView.dataSource = self
        recentItemTableView.backgroundColor = .white
        recentItemTableView.isScrollEnabled = false
        recentItemTableView.separatorColor  = .clear
        recentItemTableView.register(RecentItemsTableViewCell.self, forCellReuseIdentifier: "recentItemsTableViewCell")
        recentItemsTableViewView.addSubview(recentItemTableView)
        recentItemTableView.leftAnchor.constraint(equalTo: recentItemsTableViewView.leftAnchor).isActive = true
        recentItemTableView.rightAnchor.constraint(equalTo: recentItemsTableViewView.rightAnchor).isActive = true
        recentItemTableView.topAnchor.constraint(equalTo: recentItemsLabel.bottomAnchor,constant: 10).isActive = true
        recentItemTableView.bottomAnchor.constraint(equalTo: recentItemsTableViewView.bottomAnchor).isActive = true
        recentItemTableView.rowHeight = (600-45) / 5
        
    }
    
    
    
    
    
    func welcome() {
        
        view.backgroundColor = .white
        let navbarTitleLabel = UILabel()
        let alertController = UIAlertController(title: "What is your name", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Your Name"
        }
        
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            if let textField = alertController.textFields?.first, let name = textField.text {
                let greeting = self.getGreetingBasedOnTime()
                navbarTitleLabel.text = "\(greeting) \(name)!"
                self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            }
        }
        alertController.addAction(okAction)
        
        
        present(alertController, animated: true, completion: nil)
        let navigationBarView = UIView()
        navbarTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        navbarTitleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        navbarTitleLabel.textColor = UIColor.black
        navigationBarView.addSubview(navbarTitleLabel)
        navbarTitleLabel.topAnchor.constraint(equalTo: navigationBarView.topAnchor).isActive = true
        navbarTitleLabel.leftAnchor.constraint(equalTo: navigationBarView.leftAnchor).isActive = true
        navbarTitleLabel.bottomAnchor.constraint(equalTo: navigationBarView.bottomAnchor).isActive = true
        navbarTitleLabel.textAlignment = .left
        navigationItem.titleView = navigationBarView
    }
    
    func getGreetingBasedOnTime() -> String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: Date())
        print(hour)
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
        case searchMenuCollectionView :
            return cuisine.count
        case mostPopularCollectionView :
            return popularRestaurants.count
        default :
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case searchMenuCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as! SearchCollectionViewCell
            
            cell.cuisineLabel.text = cuisine[indexPath.row].name
            cell.cuisineImageView.image = UIImage(named: cuisine[indexPath.row].image)
            return cell
            
        case mostPopularCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as! MostPopularRestaurantCollectionViewCell
            
            
            cell.mostPopularNameLabel.text = popularRestaurants[indexPath.row].name
            cell.mostPopularRestaurantImageView.image = UIImage(named: popularRestaurants[indexPath.row].image)
            cell.mostPopularTypeLabel.text = popularRestaurants[indexPath.row].cuisine
            cell.mostPopularRatingLabel.text = "\(popularRestaurants.count)"
            return cell
        default :
            return UICollectionViewCell()
        }
    }
    
    
}

