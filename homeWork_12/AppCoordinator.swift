//
//  AppCoordinator.swift
//  homeWork_12
//
//  Created by Дмитрий Яковлев on 09.12.2019.
//  Copyright © 2019 Дмитрий Яковлев. All rights reserved.
//

import UIKit

final class AppCoordinator {
    
    private let window: UIWindow
    private let navigation: UINavigationController
    
    private var navigationHistory: [vc] = []
    
    init(window: UIWindow, navigation: UINavigationController) {
        self.window = window
        self.navigation = navigation
        window.configure(with: navigation)
        navigation.configure()
    }
    
    convenience init() {
        self.init(window: UIWindow(), navigation: UINavigationController())
    }
    
    func start() {
        let login = Tab1ViewController()
        login.delegate = self
        navigation.pushViewController(login, animated: true)
    }
}

// MARK: - Enum for history array
enum vc {
    case tab1ViewController
    case tab2ViewController
}
// MARK: - Tab1ViewController Coordinator Delegate Delegate
extension AppCoordinator: Tab1ViewControllerCoordinatorDelegate {
    
    func tab2PressedButton() {
        let tab = Tab2ViewController()
        tab.delegate = self
        navigationHistory.append(.tab1ViewController)
        navigation.pushViewController(tab, animated: false)
    }
    
}

// MARK: - Tab2ViewController Coordinator Delegate
extension AppCoordinator: Tab2ViewControllerCoordinatorDelegate {
    func tab1Pressed() {
        let tab = Tab1ViewController()
        tab.delegate = self
        navigationHistory.append(.tab2ViewController)
        navigation.pushViewController(tab, animated: false)
        
    }
    
}


// MARK: - Extension for history array
extension AppCoordinator{
    
    func backTapped(){
        guard navigationHistory.count > 0 else {return}
        switch navigationHistory.removeLast() {
        case .tab1ViewController:
            let tab = Tab1ViewController()
            tab.delegate = self
            navigation.pushViewController(tab, animated: false)
            
        case .tab2ViewController:
            let tab = Tab2ViewController()
            tab.delegate = self
            navigation.pushViewController(tab, animated: false)
        }
    }
    
    func isBackVisible()->Bool{
        if navigationHistory.count>0{
            return true
        }else{
            return false
        }
    }
}


// MARK: - UIWindow Extension
private extension UIWindow {
    func configure(with navigation: UINavigationController) {
        makeKeyAndVisible()
        rootViewController = navigation
    }
}

// MARK: - UINavigationController Extension
private extension UINavigationController {
    func configure() {
        navigationBar.isHidden = false
        self.navigationItem.setHidesBackButton(true, animated:true);
    }
}
