//
//  MainTabBarController.swift
//  homeWork_12
//
//  Created by Дмитрий Яковлев on 11.12.2019.
//  Copyright © 2019 Дмитрий Яковлев. All rights reserved.
//

import UIKit

protocol MyMainTabBarControllerDelegate: AnyObject {
    func backTapped()
}

class MainTabBarController: UITabBarController {
//    weak var delegate: MyMainTabBarControllerDelegate?
    
    
    
    var coordinators : Coordinator?
    let main = TabBarCoordinator(window: UIWindow(), tabController: UITabBarController(),navigation: UINavigationController())
    
    @objc func backTapped() {
        coordinators?.start()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        main.start()
        viewControllers = [main.tabController]
        
        back = UIBarButtonItem(barButtonSystemItem: .undo, target: self, action: #selector(backTapped))
        
//        guard let res = delegate?.isBackVisible() else {return}
//        back?.isEnabled = res
        
        navigationItem.rightBarButtonItems = [back!]
        navigationItem.setHidesBackButton(true, animated:true);    //        navigationItem.setHidesBackButton(true, animated:true);
                // Do any additional setup after loading the view.
    }
    
}
