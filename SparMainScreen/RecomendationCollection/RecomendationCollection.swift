//
//  RecomendationCollection.swift
//  SparMainScreen
//
//  Created by Мурат Кудухов on 11.08.2023.
//

import UIKit


struct RecomendationItems {
    let title: String
    let image: UIImage
    let bestPrice: Bool
    let discount: Bool
    let oldPrice: String?
}

final class RecomendationCollection: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    private var dataSource:[RecomendationItems] = []
    private var collectionView: UICollectionView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionApperance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func collectionApperance() {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 10
        
        dataSource = [.init(title: "259.90", image: UIImage(named: "lamber")!, bestPrice: false, discount: false, oldPrice: nil),
                      .init(title: "99.90",image: UIImage(named: "cola")!,bestPrice: true, discount: false, oldPrice: nil),
                      .init(title: "309.90", image: UIImage(named: "zeva")!,bestPrice: false, discount: true, oldPrice: "489.90"),
                      .init(title: "259.90", image: UIImage(named: "products")!,bestPrice: false, discount: false, oldPrice: nil),
                      .init(title: "259.90", image: UIImage(named: "products")!,bestPrice: false, discount: false, oldPrice: nil),
                      
        ]
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         
        guard let collectionView = collectionView else {return}
        
        collectionView.register(RecomendationCell.self, forCellWithReuseIdentifier: RecomendationCell.id)
        
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        
        
        addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                   collectionView.topAnchor.constraint(equalTo: topAnchor),
                   collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                   collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                   collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
               ])
    }
}



extension RecomendationCollection {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecomendationCell.id, for: indexPath) as! RecomendationCell
        
        let item = dataSource[indexPath.row]
        
        cell.configure(label: item.title, image: item.image, discount: item.discount, bestPrice: item.bestPrice, oldPrice: item.oldPrice)
        
        cell.layer.shadowColor = UIColor.systemGray3.cgColor
        cell.layer.shadowOpacity = 0.5;
        cell.layer.shadowRadius = 5.0;
        cell.layer.shadowOffset = CGSizeMake(4, 4);
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 200)
    }
    
   
}



