//
//  OffersCollection.swift
//  SparMainScreen
//
//  Created by Мурат Кудухов on 11.08.2023.
//

import UIKit


struct OffersItems {
    let title: String
    let color: UIColor
}

final class OffersCollection: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    private var dataSource:[OffersItems] = []
    private var collectionView: UICollectionView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionApperance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func collectionApperance() {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        
        dataSource = [.init(title: "Aбонемент на кофе", color: UIColor.systemMint.withAlphaComponent(0.5)),
                      .init(title: "Мои скидки", color: UIColor.systemPink.withAlphaComponent(0.6)),
                      .init(title: "Карта в подарок", color: .systemGreen.withAlphaComponent(0.5)),
                      .init(title: "Доставка за 1 час", color: UIColor.systemTeal),
                      .init(title: "Мы в соцсетях", color: UIColor.systemBlue),
                      
        ]
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         
        guard let collectionView = collectionView else {return}
        
        collectionView.register(OffersCell.self, forCellWithReuseIdentifier: OffersCell.id)
        
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



extension OffersCollection {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OffersCell.id, for: indexPath) as! OffersCell
        
        let item = dataSource[indexPath.row]
        
        cell.configure(label: item.title, color: item.color)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 105, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}



