//
//  CoursesTableViewCell.swift
//  Hell Week
//
//  Created by Student on 2019-05-19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class CoursesTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var courseImageView: UIImageView!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var courseShortDescriptionLabel: UILabel!
    @IBOutlet weak var groupNumberLabel: UILabel!

    public var dataSource: Course? {
        // Set values for each table view cell
        didSet {
            courseImageView.image = dataSource?.image
            courseNameLabel.text = dataSource?.name
            courseShortDescriptionLabel.text = dataSource?.level
            
            // Set group number
            guard let num = dataSource?.groupNum, num > 0 else {
                groupNumberLabel.text = ""
                return
            }
            groupNumberLabel.text = String(num)
        }
    }
}
