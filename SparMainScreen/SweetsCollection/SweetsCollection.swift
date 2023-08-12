//
//  SweetsCollection.swift
//  SparMainScreen
//
//  Created by Мурат Кудухов on 11.08.2023.
//

import UIKit


struct SweetsItems {
    let title: String
    let image: UIImage
    let discount: Bool
    let bestPrice: Bool
}

final class SweetsCollection: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    private var dataSource:[SweetsItems] = []
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
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        
        dataSource = [.init(title: "99.90", image: UIImage(named: "sorbetOne")!, discount: false, bestPrice: false),
                      .init(title: "99.90",image: UIImage(named: "sorbetTwo")!,discount: false, bestPrice: false),
                      .init(title: "99.90", image: UIImage(named: "sorbetOne")!,discount: false, bestPrice: false),
                      .init(title: "99.90", image: UIImage(named: "sorbetTwo")!,discount: false, bestPrice: false),
                      .init(title: "99.90", image: UIImage(named: "sorbetOne")!,discount: false, bestPrice: false),
                      
        ]
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         
        guard let collectionView = collectionView else {return}
        
        collectionView.register(SweetsCell.self, forCellWithReuseIdentifier: SweetsCell.id)
        
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



extension SweetsCollection {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SweetsCell.id, for: indexPath) as! SweetsCell
        
        let item = dataSource[indexPath.row]
        
        cell.configure(label: item.title, image: item.image, bestPrice: item.bestPrice, discount: item.discount)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 200)
    }
    
   
}




