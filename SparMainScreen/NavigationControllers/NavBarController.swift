//
//  NavBarController.swift
//  SparMainScreen
//
//  Created by Мурат Кудухов on 11.08.2023.
//

import UIKit

final class NavBarController: UINavigationController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureApperance()
    }
    
    private func configureApperance() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 17)]
        
    }
}
