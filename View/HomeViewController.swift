//
//  ViewController.swift
//  CusineAppUI
//
//  Created by Enes Kaya on 19.10.2023.
//

import UIKit
enum SectionKind :Int,CaseIterable {
    case first
    case second
    case third
    
    //computedpropertyreturn number
    //of stack vertically
    
    var itemCount : Int {
        switch self {
        case .first:
          return  2
        default:
         return 1
        }
    }
    
    var nestedGroupHeight : NSCollectionLayoutDimension {
        switch self {
        case .first:
            return .fractionalWidth(0.9)
        default:
            return .fractionalWidth(0.45)
        }
        
    }
    
    var sectionTitle: String {
        switch self {
        case .first:
            return "Search Food"
        case .second:
            return  "Popular Restaurents"
        case .third:
            return "Most Popular"
        }
    }
}

class HomeViewController: UIViewController {
    private var collectionView : UICollectionView!
    //farklı data sourcelarda tekrardan collection view i oluşturmamak için
    typealias DataSource = UICollectionViewDiffableDataSource<SectionKind, Int>
    private var dataSource : DataSource!
    
    var restaurents = [Restaurents]()
    var cuisine = [Cuisine]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        configureDataSource()
        navigationItem.backButtonTitle = "Meal Monkey"
        
        let minuteByTukTuk = Restaurents(name: "Minute By Tuk Tuk", rate: 4.9, cuisine: "(124 ratings)Cafe      Italy", image: "pizza", comment: 254)
        let cafeDeNoir = Restaurents(name: "Cafe De Noir", rate: 4.2, cuisine: "(280 ratings)Pub        English", image: "eng-breakfast", comment: 542)
        let bakesByTella = Restaurents(name: "Bakes by Tella", rate: 4.5, cuisine: "(1000 ratings)Bakery       Middle Earth", image: "bakery", comment: 877)
        
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
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .white
        collectionView.register(LabelCell.self, forCellWithReuseIdentifier: LabelCell.reuseIdentifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseIdentifier)
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        view.addSubview(collectionView)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        // item -> group -> section -> layout start from small
        // two ways to create a layout: 1) use section, 2) section provide closure
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            // Determine which section we are dealing with
            guard let sectionKind = SectionKind(rawValue: sectionIndex) else {
                fatalError("Could not create a sectionKind instance")
            }

            // Item
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let itemSpacing: CGFloat = 5
            item.contentInsets = NSDirectionalEdgeInsets(top: itemSpacing, leading: itemSpacing, bottom: itemSpacing, trailing: itemSpacing)

            // Group
            let innerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.50), heightDimension: .fractionalHeight(1.0))
            let innerGroup = NSCollectionLayoutGroup.vertical(layoutSize: innerGroupSize, subitem: item, count: sectionKind.itemCount)

            let nestedGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: sectionKind.nestedGroupHeight)

            let nestedGroup = NSCollectionLayoutGroup.horizontal(layoutSize: nestedGroupSize, subitems: [innerGroup])

            // Section
            let section = NSCollectionLayoutSection(group: nestedGroup)
            section.orthogonalScrollingBehavior = .groupPagingCentered

            // Section header
            // Steps to add a section header to a section:
            // 1) Define the size and add it to the section
            // 2) Register the supplementary view
            // 3) Dequeue the supplementary view
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))

            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)

            section.boundarySupplementaryItems = [header]

            return section
        }
        return layout
    }

    private func configureDataSource() {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { [self] collectionView, indexPath, item in
            // Hücreyi oluştur ve verileri `cuisine` dizisinden alarak yerleştir
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelCell.reuseIdentifier, for: indexPath) as? LabelCell else {
                fatalError("LabelCell dequeuing error")
            }

            let cuisineItem = cuisine[indexPath.item] // indexPath.row yerine indexPath.item kullanın
            cell.textLabel.text = cuisineItem.name
            cell.backgroundColor = .systemPurple
            cell.layer.cornerRadius = 10
            cell.cuisineImageView.image = UIImage(named: cuisineItem.image)

            return cell
        })

        dataSource.supplementaryViewProvider = { [self] collectionView, kind, indexPath in
            if kind == UICollectionView.elementKindSectionHeader {
                // Section başlığı için HeaderView kullanın
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseIdentifier, for: indexPath) as? HeaderView
                guard let sectionKind = SectionKind(rawValue: indexPath.section) else {
                    fatalError("Could not dequeue a HeaderView")
                }

                headerView?.textLabel.text = sectionKind.sectionTitle
                headerView?.textLabel.textAlignment = .left
                headerView?.textLabel.font = UIFont.preferredFont(forTextStyle: .headline)

                return headerView
            }
            return nil
        }

        // İlk snapshot oluştur
        var snapshot = NSDiffableDataSourceSnapshot<SectionKind, Int>()
        snapshot.appendSections(SectionKind.allCases) // Tüm sekmeleri ekleyin

        for sectionKind in SectionKind.allCases {
            
            var snapshot = NSDiffableDataSourceSnapshot<SectionKind, Int>()

            for sectionKind in SectionKind.allCases {
                snapshot.appendSections([sectionKind])
                snapshot.appendItems(Array(0..<cuisine.count), toSection: sectionKind)
            }

        }


        dataSource.apply(snapshot, animatingDifferences: false)
    }


}
