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
        
        let searchImage = UIImageView()
        searchImage.translatesAutoresizingMaskIntoConstraints = false
        searchImage.image = UIImage()
        searchImage.image = UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate)
        searchImage.tintColor = .gray
        searchImage.contentMode = .scaleAspectFill
        flowSearchView.addSubview(searchImage)
        searchImage.centerYAnchor.constraint(equalTo: flowSearchView.centerYAnchor).isActive = true
        searchImage.leadingAnchor.constraint(equalTo: flowSearchView.leadingAnchor,constant: 16).isActive = true
        searchImage.topAnchor.constraint(equalTo: flowSearchView.topAnchor).isActive = true
        searchImage.bottomAnchor.constraint(equalTo: flowSearchView.bottomAnchor,constant: -12).isActive = true
        searchImage.widthAnchor.constraint(equalTo: searchImage.heightAnchor, multiplier: 1).isActive = true
        
        
            
            let searchTF = UITextField()
            searchTF.translatesAutoresizingMaskIntoConstraints = false
            searchTF.attributedPlaceholder = NSAttributedString(
                string: "Search Food",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
            )

        
        searchTF.font = .systemFont(ofSize: 18)
        flowSearchView.addSubview(searchTF)
        searchTF.leftAnchor.constraint(equalTo: searchImage.rightAnchor, constant: 8).isActive = true
        searchTF.rightAnchor.constraint(equalTo: flowSearchView.rightAnchor, constant: -16).isActive = true
        searchTF.centerYAnchor.constraint(equalTo: flowSearchView.centerYAnchor).isActive = true
        searchTF.heightAnchor.constraint(equalTo: flowSearchView.heightAnchor,multiplier: 0.8).isActive = true
        
        //MARK: KITCHENS CV
        let kitchenCVLayout = UICollectionViewFlowLayout()
        kitchenCVLayout.itemSize = CGSize(width: view.frame.width / 3.5, height: 140)
        kitchenCVLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        kitchenCVLayout.minimumLineSpacing = 10
        kitchenCVLayout.minimumInteritemSpacing = 10
        kitchenCVLayout.scrollDirection = .horizontal
        searchMenuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: kitchenCVLayout)
        searchMenuCollectionView.translatesAutoresizingMaskIntoConstraints = false
        searchMenuCollectionView.backgroundColor = .white
        searchMenuCollectionView.showsVerticalScrollIndicator = false
        searchMenuCollectionView.showsHorizontalScrollIndicator = false
        searchMenuCollectionView.delegate = self
        searchMenuCollectionView.dataSource = self
        searchMenuCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "kitchenCell")
        flowStackView.addArrangedSubview(searchMenuCollectionView)
        searchMenuCollectionView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        
        //MARK: RESTAURANTS TV
        flowStackView.addArrangedSubview(popularRestaurantsTableViewView)
        
        let popularLabel = UILabel()
        popularLabel.translatesAutoresizingMaskIntoConstraints = false
        popularLabel.text = "Popular Restaurants"
        popularLabel.textColor = .black
        popularLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        popularLabel.textAlignment = .left
        //popularLabel.hero.id = "titleLabel"
        popularRestaurantsTableViewView.addSubview(popularLabel)
        popularLabel.leftAnchor.constraint(equalTo: popularRestaurantsTableViewView.leftAnchor, constant: 10).isActive = true
        popularLabel.topAnchor.constraint(equalTo: popularRestaurantsTableViewView.topAnchor, constant: 10).isActive = true
        popularLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        let viewAllLabel = UILabel()
        viewAllLabel.translatesAutoresizingMaskIntoConstraints = false
        viewAllLabel.text = "View All"
        viewAllLabel.textColor = UIColor(named:"AppOrange")
        viewAllLabel.font = .init(name: "Metropolis-Bold", size: 14)
        viewAllLabel.textAlignment = .right
        popularRestaurantsTableViewView.addSubview(viewAllLabel)
        viewAllLabel.centerYAnchor.constraint(equalTo: popularLabel.centerYAnchor).isActive = true
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
        restaurantsTableView.topAnchor.constraint(equalTo: popularLabel.bottomAnchor,constant: 10).isActive = true
        restaurantsTableView.bottomAnchor.constraint(equalTo: popularRestaurantsTableViewView.bottomAnchor).isActive = true
        restaurantsTableView.rowHeight = 265
        //MARK: RESTAURANTS CV
        flowStackView.addArrangedSubview(mostPopularCollectionViewView)
        
        let popularLabel2 = UILabel()
        popularLabel2.translatesAutoresizingMaskIntoConstraints = false
        popularLabel2.text = "Most Popular"
        popularLabel2.textColor = .black
        popularLabel2.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        popularLabel2.textAlignment = .left
        //popularLabel2.hero.id = "titleLabel"
        mostPopularCollectionViewView.addSubview(popularLabel2)
        popularLabel2.leftAnchor.constraint(equalTo: mostPopularCollectionViewView.leftAnchor, constant: 10).isActive = true
        popularLabel2.topAnchor.constraint(equalTo: mostPopularCollectionViewView.topAnchor).isActive = true
        popularLabel2.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        let viewAllLabel2 = UILabel()
        viewAllLabel2.translatesAutoresizingMaskIntoConstraints = false
        viewAllLabel2.text = "View All"
        viewAllLabel2.textColor = UIColor(named:"AppOrange")
        viewAllLabel2.font = .init(name: "Metropolis-Bold", size: 14)
        viewAllLabel2.textAlignment = .right
        mostPopularCollectionViewView.addSubview(viewAllLabel2)
        viewAllLabel2.centerYAnchor.constraint(equalTo: popularLabel2.centerYAnchor).isActive = true
        viewAllLabel2.rightAnchor.constraint(equalTo: mostPopularCollectionViewView.rightAnchor, constant: -10).isActive = true
        
        let layout2 = UICollectionViewFlowLayout()
        layout2.itemSize = CGSize(width: view.frame.width * 0.6, height: 190)
        layout2.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout2.minimumLineSpacing = 20
        layout2.scrollDirection = .horizontal
        mostPopularCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout2)
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
        mostPopularCollectionView.topAnchor.constraint(equalTo: popularLabel2.bottomAnchor,constant: 10).isActive = true
        mostPopularCollectionView.bottomAnchor.constraint(equalTo: mostPopularCollectionViewView.bottomAnchor).isActive = true
        
        //MARK: RECENT ITEMS TV
        flowStackView.addArrangedSubview(recentItemsTableViewView)
        
        let popularLabel3 = UILabel()
        popularLabel3.translatesAutoresizingMaskIntoConstraints = false
        popularLabel3.text = "Recent Items"
        popularLabel3.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        popularLabel3.textColor = .black
        popularLabel3.textAlignment = .left
        //popularLabel3.hero.id = "titleLabel"
        recentItemsTableViewView.addSubview(popularLabel3)
        popularLabel3.leftAnchor.constraint(equalTo: recentItemsTableViewView.leftAnchor, constant: 10).isActive = true
        popularLabel3.topAnchor.constraint(equalTo: recentItemsTableViewView.topAnchor, constant: 10).isActive = true
        popularLabel3.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        let viewAllLabel3 = UILabel()
        viewAllLabel3.translatesAutoresizingMaskIntoConstraints = false
        viewAllLabel3.text = "View All"
        viewAllLabel3.textColor = UIColor(named:"AppOrange")
        viewAllLabel3.font = .init(name: "Metropolis-Bold", size: 14)
        viewAllLabel3.textAlignment = .right
        recentItemsTableViewView.addSubview(viewAllLabel3)
        viewAllLabel3.centerYAnchor.constraint(equalTo: popularLabel3.centerYAnchor).isActive = true
        viewAllLabel3.rightAnchor.constraint(equalTo: recentItemsTableViewView.rightAnchor, constant: -10).isActive = true
        
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
        recentItemTableView.topAnchor.constraint(equalTo: popularLabel3.bottomAnchor,constant: 10).isActive = true
        recentItemTableView.bottomAnchor.constraint(equalTo: recentItemsTableViewView.bottomAnchor).isActive = true
        recentItemTableView.rowHeight = (600-45) / 5
        
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kitchenCell", for: indexPath) as! SearchCollectionViewCell
            
            cell.cuisineLabel.text = cuisine[indexPath.row].name
            cell.cuisineImageView.image = UIImage(named: cuisine[indexPath.row].image)
            return cell
            
        case mostPopularCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as! MostPopularRestaurantCollectionViewCell
            //cell.isHeroEnabled = true
            
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

