//
//  ViewController.swift
//  SparMainScreen
//
//  Created by Мурат Кудухов on 11.08.2023.
//

import UIKit

class MainController: UIViewController {
    
    private let historyCollection = HistoryCollection()
    private let discountCollection = DiscountCollectionView()
    private let bonusBlock = BonusBlockView(bonus: "0")
    private let offersCollection = OffersCollection()
    private let recomendationCollection = RecomendationCollection()
    private let sweetsCollection = SweetsCollection()
    
    private lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "Город"
        bar.clipsToBounds = true
        bar.image(for: .bookmark, state: .normal)
        bar.searchTextField.layer.backgroundColor = UIColor.white.cgColor
        bar.searchTextField.layer.masksToBounds = true
        bar.searchTextField.layer.cornerRadius = 16
        bar.searchTextField.layer.borderWidth = 1
        bar.searchTextField.layer.borderColor = UIColor.systemGray.cgColor
        bar.searchTextField.leftView = UIImageView(image: UIImage(named: "location"))
        bar.barTintColor = .white
        return bar
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.isDirectionalLockEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let middleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private let recomedationLabel: UILabel = {
        let label = UILabel()
        label.text = "Рекомендуем"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private let sweetsLabel: UILabel = {
        let label = UILabel()
        label.text = "Сладкое настроение"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "text.justify"), for: .normal)
        button.tintColor = .systemGreen
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(customView: button)
        



        view.addSubview(scrollView)
        middleView.addSubview(historyCollection)
        middleView.addSubview(discountCollection)
        middleView.addSubview(offersCollection)
        middleView.addSubview(bonusBlock)
        middleView.addSubview(recomendationCollection)
        middleView.addSubview(recomedationLabel)
        middleView.addSubview(sweetsCollection)
        middleView.addSubview(sweetsLabel)

        contentView.addSubview(middleView)
        scrollView.addSubview(contentView)
        
        constraints()
        
        title = R.Strings.TabBar.title(for: .main)
        
    }
    
    func constraints() {
        offersCollection.translatesAutoresizingMaskIntoConstraints = false
        historyCollection.translatesAutoresizingMaskIntoConstraints = false
        discountCollection.translatesAutoresizingMaskIntoConstraints = false
        bonusBlock.translatesAutoresizingMaskIntoConstraints = false
        recomendationCollection.translatesAutoresizingMaskIntoConstraints = false
        sweetsCollection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 1200),
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            middleView.topAnchor.constraint(equalTo: contentView.topAnchor),
            middleView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            middleView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            middleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            recomendationCollection.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 16),
            recomendationCollection.topAnchor.constraint(equalTo: recomedationLabel.bottomAnchor, constant: 16),
            recomendationCollection.widthAnchor.constraint(equalToConstant: view.bounds.width),
            recomendationCollection.heightAnchor.constraint(equalToConstant: 200),
            
            sweetsCollection.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 16),
            sweetsCollection.topAnchor.constraint(equalTo: sweetsLabel.bottomAnchor, constant: 16),
            sweetsCollection.widthAnchor.constraint(equalToConstant: view.bounds.width),
            sweetsCollection.heightAnchor.constraint(equalToConstant: 200),
            
            recomedationLabel.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 16),
            recomedationLabel.topAnchor.constraint(equalTo: offersCollection.bottomAnchor, constant: 16),
            
            sweetsLabel.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 16),
            sweetsLabel.topAnchor.constraint(equalTo: recomendationCollection.bottomAnchor, constant: 16),
            
            historyCollection.topAnchor.constraint(equalTo: middleView.topAnchor, constant: 8),
            historyCollection.leadingAnchor.constraint(equalTo: middleView.leadingAnchor,constant: 8),
            historyCollection.widthAnchor.constraint(equalToConstant: view.bounds.width),
            historyCollection.heightAnchor.constraint(equalToConstant: 120),
            
            discountCollection.topAnchor.constraint(equalTo: historyCollection.bottomAnchor, constant: 16),
            discountCollection.leadingAnchor.constraint(equalTo: middleView.leadingAnchor,constant: 8),
            discountCollection.widthAnchor.constraint(equalToConstant: view.bounds.width),
            discountCollection.heightAnchor.constraint(equalToConstant: 174),
            
            bonusBlock.topAnchor.constraint(equalTo: discountCollection.bottomAnchor, constant: 16),
            bonusBlock.centerXAnchor.constraint(equalTo: middleView.centerXAnchor),
            bonusBlock.widthAnchor.constraint(equalToConstant: view.bounds.width - 16),
            bonusBlock.heightAnchor.constraint(equalToConstant: 130),
            
            offersCollection.topAnchor.constraint(equalTo: bonusBlock.bottomAnchor, constant: 16),
            offersCollection.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 16),
            offersCollection.widthAnchor.constraint(equalToConstant: view.bounds.width - 16),
            offersCollection.heightAnchor.constraint(equalToConstant: 140),
        
        ])
    }


}

