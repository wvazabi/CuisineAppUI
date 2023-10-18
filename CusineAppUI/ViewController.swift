//
//  ViewController.swift
//  CusineAppUI
//
//  Created by Enes Kaya on 16.10.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    let restaurentsTableView = UITableView()
    var restaurents = [Restaurents]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.view.backgroundColor = .green
        
        restaurentsTableView.delegate = self
        restaurentsTableView.dataSource = self
        setupUI()
        
        let minuteByTukTuk = Restaurents(name: "Minute By Tuk Tuk", rate: 4.9, cuisine: "Italy", image: "pizza")
        let cafeDeNoir = Restaurents(name: "Cafe De Noir", rate: 4.2, cuisine: "English", image: "eng-breakfast")
        let bakesByTella = Restaurents(name: "Bakes by Tella", rate: 4.5, cuisine: "Middle Earth", image: "bakery")
        
        restaurents.append(minuteByTukTuk)
        restaurents.append(cafeDeNoir)
        restaurents.append(bakesByTella)
        
        
    }
    // Kod karmaşıklığını önlemek için private setUPUI fonksiyonu oluşturuldu
    
    private func setupUI() {
        restaurentsTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        view.addSubview(restaurentsTableView)
        restaurentsTableView.translatesAutoresizingMaskIntoConstraints = false
        restaurentsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        restaurentsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        restaurentsTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        restaurentsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        cell.restaurentsLabel.text = restaurents[indexPath.row].name
        cell.restaurentsRatingLabel.text = String(restaurents[indexPath.row].rate)
        cell.restaurentsImageView.image = UIImage(named: restaurents[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 380
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.lightGray // Başlık arka plan rengi
        
        let viewAllButton : UIButton = {
            let button = UIButton()
            button.setTitle("View all", for: .normal)
            button.setTitleColor(UIColor.orange, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        headerView.addSubview(viewAllButton)
        
        let label = UILabel()
        label.text = "Popular Restaurents"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(label)
        
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            viewAllButton.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 80),
            viewAllButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
            
        ])
        return headerView
    }
    
    // Başlık yüksekliğini ayarlayın
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40 // Başlık yüksekliği
    }
}



