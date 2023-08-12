//
//  HistoryCell.swift
//  SparMainScreen
//
//  Created by Мурат Кудухов on 11.08.2023.
//

import UIKit

class HistoryCollectionCell: UICollectionViewCell {
    
    static var id = "HistoryCollectionCell"
    
    private let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private let imageViewBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 31
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.systemGreen.cgColor
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 26
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Album"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        contentView.addSubview(container)
        contentView.addSubview(imageViewBackground)
        contentView.addSubview(imageView)
        contentView.addSubview(mainLabel)
        
        contentView.clipsToBounds = true
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    public func configure(label: String, image: UIImage) {
        mainLabel.text = label
        imageView.image = image
        
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            container.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -8),
            container.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -8),
            container.topAnchor.constraint(equalTo: topAnchor,constant: 8),
            
            imageViewBackground.topAnchor.constraint(equalTo: container.topAnchor),
            imageViewBackground.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageViewBackground.heightAnchor.constraint(equalToConstant: 65),
            imageViewBackground.widthAnchor.constraint(equalTo: imageViewBackground.heightAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: imageViewBackground.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: imageViewBackground.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 55),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            
            mainLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            mainLabel.widthAnchor.constraint(equalToConstant: 80)
          
            
        ])
    }
    
}



