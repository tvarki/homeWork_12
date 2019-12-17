//
//  Coordinator.swift
//  homeWork_12
//
//  Created by Дмитрий Яковлев on 11.12.2019.
//  Copyright © 2019 Дмитрий Яковлев. All rights reserved.
//

import UIKit

protocol Coordinator : AnyObject {

    var window: UIWindow { get set }
    var navigation: UINavigationController { get set }
    var navigationHistory: [vc] { get set }
    
    
    func start()
}
