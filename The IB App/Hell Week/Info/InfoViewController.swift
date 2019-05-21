//
//  InfoViewController.swift
//  Hell Week
//
//  Created by Student on 2019-05-19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var groupNumLabel: UILabel!
    @IBOutlet weak var courseImageView: UIImageView!
    @IBOutlet weak var courseDescriptionLabel: UILabel!
    
    
    // MARK: - Properties
    
    public var course: Course?
}

// MARK: - UIViewController methods

extension InfoViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        courseImageView.image = course?.image
        courseNameLabel.text = course?.name
        courseDescriptionLabel.text = course?.description
        courseDescriptionLabel.setLineHeight(lineHeight: 1.15)
        
        // Set group number
        guard let num = course?.groupNum, num > 0 else {
            groupNumLabel.text = "Core course"
            return
        }
        groupNumLabel.text = "Group " + String(num)
    }
}
