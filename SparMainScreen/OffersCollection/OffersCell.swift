//
//  OffersCell.swift
//  SparMainScreen
//
//  Created by Мурат Кудухов on 11.08.2023.
//

import UIKit

class OffersCell: UICollectionViewCell {
    
    static var id = "OffersCell"
    
    private let container: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Album"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        contentView.addSubview(container)
        contentView.addSubview(imageView)
        contentView.addSubview(mainLabel)
        
        contentView.clipsToBounds = true
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    public func configure(label: String, color: UIColor) {
        mainLabel.text = label
        container.backgroundColor = color
        
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            container.topAnchor.constraint(equalTo: topAnchor),
            
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 72),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            
            mainLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
            mainLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            mainLabel.widthAnchor.constraint(equalToConstant: 85)
          
            
        ])
    }
    
}




