//
//  HistoryCollectionView.swift
//  SparMainScreen
//
//  Created by Мурат Кудухов on 11.08.2023.
//

import UIKit


struct HistoryItems {
    let title: String
    let image: UIImage
}



final class HistoryCollection: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    private var dataSource:[HistoryItems] = []
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
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 5
        
        dataSource = [.init(title: "Привелегии Мой SPAR", image: UIImage(named: "spar")!),
                      .init(title: "Мы в соцсетях", image: UIImage(named: "social")!),
                      .init(title: "3 рецепта коктейлей", image: UIImage(named: "coctail")!),
                      .init(title: "Дегустация в SPAR", image: UIImage(named: "eating")!),
                      .init(title: "Привелегии Мой SPAR", image: UIImage(named: "spar")!),
                      .init(title: "Привелегии Мой SPAR", image: UIImage(named: "spar")!),
                      .init(title: "Привелегии Мой SPAR", image: UIImage(named: "spar")!),
        ]
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         
        guard let collectionView = collectionView else {return}
        
        collectionView.register(HistoryCollectionCell.self, forCellWithReuseIdentifier: HistoryCollectionCell.id)
        
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



extension HistoryCollection {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HistoryCollectionCell.id, for: indexPath) as! HistoryCollectionCell
        
        let item = dataSource[indexPath.row]
        
        cell.configure(label: item.title, image: item.image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 90, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}


