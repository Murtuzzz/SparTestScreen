//
//  RecomendationCell.swift
//  SparMainScreen
//
//  Created by Мурат Кудухов on 11.08.2023.
//

import UIKit

class RecomendationCell: UICollectionViewCell {
    
    static var id = "RecomendationCell"
    
    private let container: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.systemGray3.cgColor
        view.layer.shadowOpacity = 0.5;
        view.layer.shadowRadius = 5.0;
        view.layer.shadowOffset = CGSizeMake(4, 4);
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let basketButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "basket"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 20
        return button
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Album"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let oldPrice: UILabel = {
        let label = UILabel()
        label.text = "Album"
        label.textColor = .gray
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bestPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "Супер Цена"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let discountLabel: UILabel = {
        let label = UILabel()
        label.text = "Удар по ценам"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let discountView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemRed.withAlphaComponent(0.5)
        return view
    }()
    
    private let discountLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        layer.cornerRadius = 20
        contentView.addSubview(container)
        contentView.addSubview(imageView)
        contentView.addSubview(mainLabel)
        contentView.addSubview(basketButton)
        
        
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    public func configure(label: String, image: UIImage, discount: Bool, bestPrice: Bool, oldPrice: String? = nil) {
        self.oldPrice.text = oldPrice
        mainLabel.text = label
        imageView.image = image
        
        if bestPrice {
            container.addSubview(discountView)
            container.addSubview(bestPriceLabel)
            
            container.layer.masksToBounds = true
            
            NSLayoutConstraint.activate([
                
                bestPriceLabel.centerYAnchor.constraint(equalTo: discountView.centerYAnchor),
                bestPriceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                
                discountView.topAnchor.constraint(equalTo: container.topAnchor),
                discountView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -8),
                discountView.widthAnchor.constraint(equalToConstant: 100),
                discountView.heightAnchor.constraint(equalToConstant: 20)
            ])
            
        }
        
        if discount && oldPrice != nil {
            container.addSubview(discountView)
            container.addSubview(discountLabel)
            container.addSubview(self.oldPrice)
            container.addSubview(discountLine)
            
            
            container.clipsToBounds = true
            
            NSLayoutConstraint.activate([
                
                discountLine.leadingAnchor.constraint(equalTo: self.oldPrice.leadingAnchor),
                discountLine.centerYAnchor.constraint(equalTo: self.oldPrice.centerYAnchor),
                discountLine.widthAnchor.constraint(equalToConstant: 46),
                discountLine.heightAnchor.constraint(equalToConstant: 1),
                
                mainLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -24),
                
                self.oldPrice.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -8),
                self.oldPrice.leadingAnchor.constraint(equalTo: mainLabel.leadingAnchor),
                self.oldPrice.widthAnchor.constraint(equalToConstant: 50),
                
                discountLabel.centerYAnchor.constraint(equalTo: discountView.centerYAnchor),
                discountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                
                discountView.topAnchor.constraint(equalTo: container.topAnchor),
                discountView.leadingAnchor.constraint(equalTo: leadingAnchor),
                discountView.widthAnchor.constraint(equalToConstant: 120),
                discountView.heightAnchor.constraint(equalToConstant: 20)
            ])
        } else {
            NSLayoutConstraint.activate([mainLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16),])
        }
        
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            
            basketButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -8),
            basketButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -8),
            basketButton.heightAnchor.constraint(equalToConstant:40),
            basketButton.widthAnchor.constraint(equalTo: basketButton.heightAnchor),
            
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            container.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            
            mainLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 8),
            mainLabel.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
}




