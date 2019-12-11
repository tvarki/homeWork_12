//
//  TabBarCoordinator.swift
//  homeWork_12
//
//  Created by Дмитрий Яковлев on 11.12.2019.
//  Copyright © 2019 Дмитрий Яковлев. All rights reserved.
//

import UIKit

protocol TabBarCoordinatorDelegate: AnyObject {
    func undoPressed()
}

final class TabBarCoordinator: Coordinator{
    var childCoordinators: Coordinator?
    
    var window: UIWindow
    var tabController: UITabBarController
    
    var navigationHistory: [vc] = []
    var navigation : UINavigationController
    
    init(window: UIWindow, tabController: UITabBarController, navigation : UINavigationController) {
        
        self.window = window
        self.tabController = tabController
        self.navigation = navigation
        self.navigation.configure()
    }
    
    convenience init() {
        self.init(window: UIWindow(), tabController: UITabBarController(), navigation: UINavigationController())
    }
    
    func start() {
        let tab1 = Tab1ViewController()
        tab1.delegate = self
        tab1.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let tab2 = Tab2ViewController()
        tab2.delegate = self
        tab2.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        tabController.viewControllers = [tab1,tab2]
        
        
//        navigation.pushViewController(tab1, animated: true)
    }
}


// MARK: - Tab1ViewController Coordinator Delegate Delegate
extension TabBarCoordinator: Tab1ViewControllerCoordinatorDelegate {

    func tab2PressedButton() {
        let tab = Tab2ViewController()
        tab.delegate = self
    //        navigation.pushViewController(tab, animated: false)
    }
    
}

// MARK: - Tab2ViewController Coordinator Delegate
extension TabBarCoordinator: Tab2ViewControllerCoordinatorDelegate {
    func tab1Pressed() {
        let tab = Tab1ViewController()
        tab.delegate = self
//        navigation.pushViewController(tab, animated: false)
        
    }
    
}



// MARK: - UIWindow Extension
private extension UIWindow {
    func configure(with navigation: UINavigationController) {
        makeKeyAndVisible()

    }
}

// MARK: - UINavigationController Extension
private extension UINavigationController {
    func configure() {
        navigationBar.isHidden = false
        self.navigationItem.setHidesBackButton(true, animated:true);
    }
}
