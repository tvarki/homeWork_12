//
//  Tab1ViewController.swift
//  homeWork_12
//
//  Created by Дмитрий Яковлев on 09.12.2019.
//  Copyright © 2019 Дмитрий Яковлев. All rights reserved.
//

import UIKit

// MARK: - Protocol for coordinator delegate
protocol Tab1ViewControllerCoordinatorDelegate: AnyObject {
    func tab2PressedButton()
    func backTapped()
    func isBackVisible()->Bool
}

final class Tab1ViewController: UIViewController {
    
    weak var delegate: Tab1ViewControllerCoordinatorDelegate?
    var button2:UIButton = UIButton()
    var button:UIButton = UIButton()
    var back : UIBarButtonItem?
    
    
    // MARK: - Click buttons functions
    @objc func didPressButton() {
        delegate?.tab2PressedButton()
    }
    
    @objc func backTapped() {
        delegate?.backTapped()
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
        view.backgroundColor = .blue
        button2.setTitle("Tab1", for: .normal)
        button2.sizeToFit()
        button2.center = CGPoint(x: 100, y: 100)
        button2.backgroundColor = .systemGray
        
        button.setTitle("Tab2", for: .normal)
        button.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)
        button.sizeToFit()
        
        button.center = CGPoint(x: (view.frame.width/2) + 100, y: 100)
        
        view.addSubview(button2)
        view.addSubview(button)
    
        back = UIBarButtonItem(barButtonSystemItem: .undo, target: self, action: #selector(backTapped))
        
        guard let res = delegate?.isBackVisible() else {return}
        back?.isEnabled = res
        
        navigationItem.rightBarButtonItems = [back!]
        navigationItem.setHidesBackButton(true, animated:true);
    }
}
