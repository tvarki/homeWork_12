//
//  Tab2ViewController.swift
//  homeWork_12
//
//  Created by Дмитрий Яковлев on 09.12.2019.
//  Copyright © 2019 Дмитрий Яковлев. All rights reserved.
//

import UIKit

// MARK: - Protocol for coordinator delegate
protocol Tab2ViewControllerCoordinatorDelegate: AnyObject {
    func tab1Pressed()
}

final class Tab2ViewController: UIViewController {
    
    weak var delegate: Tab2ViewControllerCoordinatorDelegate?
    
    var button2:UIButton = UIButton()
    var button:UIButton = UIButton()
    var back : UIBarButtonItem?

    // MARK: - Click buttons functions
    @objc func didPressButton() {
        delegate?.tab1Pressed()
    }
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.button2 = UIButton()
        self.button = UIButton()
        setup()
    }
    
    // MARK: - View setup
    func setup(){
        view.backgroundColor = .red
        
        button2.setTitle("Tab2", for: .normal)
        button2.sizeToFit()
        button2.center = CGPoint(x:(view.frame.width/2) + 100, y: 100)
        button2.backgroundColor = .systemGray
        view.addSubview(button2)
        
        button.setTitle("Tab1", for: .normal)
        button.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)
        button.sizeToFit()
        button.center = CGPoint(x: 100, y: 100)
        view.addSubview(button)
    
//        navigationItem.rightBarButtonItems = [back!]
//
//        navigationItem.setHidesBackButton(true, animated:true)
    }
    
}
