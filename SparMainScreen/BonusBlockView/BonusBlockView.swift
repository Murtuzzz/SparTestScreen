//
//  BonusBlockView.swift
//  SparMainScreen
//
//  Created by Мурат Кудухов on 11.08.2023.
//

import UIKit

class BonusBlockView: UIView {
    
    private let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private let imageViewBackground: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "qr-code")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let bonusLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bonusText: UILabel = {
        let label = UILabel()
        label.text = "бонусов"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoLabelOne: UILabel = {
        let label = UILabel()
        label.text = "СКИДКИ ДО 30%"
        label.textColor = .systemGreen
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoLabelTwo: UILabel = {
        let label = UILabel()
        label.text = "C 13 ПО 15 ИЮЛЯ"
        label.textColor = .systemGreen
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(bonus: String) {
        super.init(frame: .zero)
        backgroundColor = .clear
        bonusLabel.text = bonus
        addSubview(container)
        addSubview(imageViewBackground)
        addSubview(imageView)
        addSubview(bonusLabel)
        addSubview(bonusText)
        
        clipsToBounds = true
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func constraints() {
        
        NSLayoutConstraint.activate([
            
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            container.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            container.topAnchor.constraint(equalTo: topAnchor),
            
            imageViewBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageViewBackground.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -8),
            imageViewBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageViewBackground.topAnchor.constraint(equalTo: topAnchor),
            
            bonusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            bonusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
            bonusText.leadingAnchor.constraint(equalTo: bonusLabel.trailingAnchor, constant: 8),
            bonusText.bottomAnchor.constraint(equalTo: bonusLabel.bottomAnchor, constant: -8),
            
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),

          
            
        ])
    }
    
}







