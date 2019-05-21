//
//  ViewController.swift
//  Hell Week
//
//  Created by Student on 2019-05-15.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var ibLogoImageView: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var descriptionView: UIView!
    
    @IBOutlet weak var enterButton: UIButton!
}

// MARK: - UIViewController methods
extension HomeViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ibLogoImageView.alpha = 0
        welcomeLabel.alpha = 0
        descriptionView.alpha = 0
        enterButton.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.5, animations: { [weak self] in
            self?.ibLogoImageView.alpha = 1
            self?.welcomeLabel.alpha = 1
            }, completion: { (finished: Bool) in
                UIView.animate(withDuration: 2.5, animations: { [weak self] in
                    self?.descriptionView.alpha = 1
                    }, completion: { (finished: Bool) in
                        UIView.animate(withDuration: 1.5, animations: { [weak self] in
                            self?.enterButton.alpha = 1
                            }, completion: nil)
                })
            })
    }
}

