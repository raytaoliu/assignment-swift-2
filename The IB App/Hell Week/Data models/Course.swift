//
//  Course.swift
//  Hell Week
//
//  Created by Student on 2019-05-18.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation
import UIKit

struct Course {
    // MARK: - Properties
    public let name: String
    public let image: UIImage
    public let description: String
    public let groupNum: Int
    public let level: String
    
    // MARK: - Initializers
    init(name: String, image: UIImage, description: String, groupNum: Int, level: String) {
        self.name = name
        self.image = image
        self.description = description
        self.groupNum = groupNum
        self.level = level
    }
}

// MARK: - Public methods

extension Course {
    func searchCourse(with inputString: String) -> Bool {
        let input = inputString.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        if name.lowercased().contains(input) {
            return true
        } else {
            return false
        }
    }
}
