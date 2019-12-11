//
//  MainViewController.swift
//  homeWork_12
//
//  Created by Дмитрий Яковлев on 11.12.2019.
//  Copyright © 2019 Дмитрий Яковлев. All rights reserved.
//

import UIKit


protocol MainViewControllerDelegate: AnyObject {
    func buttonPressed()
    func backTapped()
    func isBackVisible()->Bool

}

var back : UIBarButtonItem?


class MainViewController: UIViewController {

    weak var delegate: MainViewControllerDelegate?
       var button:UIButton = UIButton()
       var back : UIBarButtonItem?
     
    
   override func viewDidLoad() {
            super.viewDidLoad()
            
            self.button = UIButton()
            
            setup()
        }
        
    @objc func backTapped() {
         delegate?.backTapped()
     }
    
        // MARK: - View setup
        func setup(){
            view.backgroundColor = .systemTeal
            button.setTitle("TabBar", for: .normal)
            button.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)
            button.sizeToFit()
            
            button.center = CGPoint(x: (view.frame.width)/2, y: 100)
            
            view.addSubview(button)

            back = UIBarButtonItem(barButtonSystemItem: .undo, target: self, action: #selector(backTapped))
                 
                 guard let res = delegate?.isBackVisible() else {return}
                 back?.isEnabled = res
                 
                 navigationItem.rightBarButtonItems = [back!]
                 navigationItem.setHidesBackButton(true, animated:true);    //        navigationItem.setHidesBackButton(true, animated:true);
        }
    @objc func didPressButton() {
         delegate?.buttonPressed()
     }

}
