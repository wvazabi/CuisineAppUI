import UIKit

class ViewController3: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var cuisine = [Cuisine]()
    let offer = Cuisine(name: "Offers", image: "offers")
    let srilanka = Cuisine(name: "Sri Lankan", image: "srilanka")
    let italian = Cuisine(name: "Italian", image: "italian")
    let indian = Cuisine(name: "Indian", image: "indian")
    let turkish = Cuisine(name: "Turkish", image: "turkish")
    let spanish = Cuisine(name: "Spanish", image: "spanish")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView oluştur
        tableView = UITableView(frame: view.frame, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        // TableView hücrelerini kaydır
        tableView.register(HorizontalCollectionViewCell.self, forCellReuseIdentifier: "horizontalCell")
        tableView.register(VerticalCollectionViewCell.self, forCellReuseIdentifier: "verticalCell")
        
        
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4 // Toplam 4 satır
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // Her satırda sadece bir UICollectionView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "horizontalCell", for: indexPath) as! HorizontalCollectionViewCell
            cell.configure(with: [offer, srilanka, italian, indian, turkish, spanish])
            return cell
        } else {
            // Diğer satırlar için gerekli hücre işlemlerini burada yapın
            return UITableViewCell()
        }
    

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
