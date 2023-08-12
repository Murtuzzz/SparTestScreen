//
//  R.swift
//  SparMainScreen
//
//  Created by Мурат Кудухов on 11.08.2023.
//

import UIKit

enum R {
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .main: return "Главная"
                case .catalog: return "Каталог"
                case .basket: return "Корзина"
                case .profile: return "Профиль"
                }
            }
        }
    }
    
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .main: return UIImage(systemName: "house.fill")
                case .catalog: return UIImage(systemName: "square.split.2x2.fill")
                case .basket: return UIImage(systemName: "basket")
                case .profile: return UIImage(systemName: "person.crop.circle")
                }
            }
        }
    }
}
