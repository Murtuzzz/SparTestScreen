//
//  TabBarController.swift
//  SparMainScreen
//
//  Created by Мурат Кудухов on 11.08.2023.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case main
    case catalog
    case basket
    case profile
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configureApperance()
        switchTo(tab: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    private func configureApperance() {
        tabBar.isTranslucent = true
        tabBar.tintColor = .systemGreen
        tabBar.backgroundColor = .systemGray6
        tabBar.layer.borderColor = UIColor.systemGray5.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: R.Strings.TabBar.title(for: tab),
                                                 image: R.Images.TabBar.icon(for: tab),
                                                 tag: tab.rawValue)
            return controller
        }
        setViewControllers(controllers, animated: false)
    }
    
    
    private func getController(for tab: Tabs) -> UIViewController {
        switch tab {
        case .main: return MainController()
        case .catalog: return CatalogController()
        case .basket: return BasketController()
        case .profile: return ProfileController()
        }
    }
}
