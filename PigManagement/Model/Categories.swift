//
//  Categories.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 27/02/2021.
//

import UIKit


struct Categories {
    var title: String
    var number: String
    var percentage: String
    var color: UIColor


    init(title: String, number: String, percentage: String, color: UIColor) {
        self.title = title
        self.number = number
        self.percentage = percentage
        self.color = color
    }
}
