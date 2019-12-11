//
//  AppCoordinator.swift
//  homeWork_12
//
//  Created by Дмитрий Яковлев on 09.12.2019.
//  Copyright © 2019 Дмитрий Яковлев. All rights reserved.
//
import UIKit

final class AppCoordinator : MyMainTabBarControllerDelegate, Coordinator{
    var window: UIWindow
    
    var navigation: UINavigationController
    
    var childCoordinators: Coordinator?
    var navigationHistory: [vc] = []
            
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
        let v = MainViewController()
       
        v.delegate = self
        navigation.pushViewController(v, animated: true)
    }
}

// MARK: - Enum for history array
enum vc {
    case mainViewController
    case mainTabBarController
}
// MARK: - Tab1ViewController Coordinator Delegate Delegate
extension AppCoordinator: MainViewControllerDelegate {
    
    func buttonPressed() {
        
        let tabBar = MainTabBarController()
        tabBar.coordinators = self
        
        navigation.pushViewController(tabBar, animated: true)
    }
    
    
  
}





// MARK: - Extension for history array
extension AppCoordinator{
    
    func backTapped(){
        guard navigationHistory.count > 0 else {return}
        switch navigationHistory.removeLast() {
        case .mainViewController:
            let tab = MainViewController()
            tab.delegate = self
            navigation.pushViewController(tab, animated: false)
            
        case .mainTabBarController:
            let tab = MainTabBarController()
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



extension AppCoordinator : TabBarCoordinatorDelegate {
    func undoPressed() {
        backTapped()
    }
}
