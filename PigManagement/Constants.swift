//
//  Constants.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 24/02/2021.
//

import UIKit

struct Constants {
    static let firstColor = UIColor(hexString: "03045E")
    static let secondColor = UIColor(hexString: "023E8A")
    static let thirdColor = UIColor(hexString: "0077B6")
    static let forthColor = UIColor(hexString: "0096C7")
    static let fifthColor = UIColor(hexString: "00B4D8")
    static let sixthColor = UIColor(hexString: "48CAE4")
    static let seventhColor = UIColor(hexString: "90E0EF")
    static let eighthColor = UIColor(hexString: "ADE8F4")
    static let ninthColor = UIColor(hexString: "CAF0F8")
    static let colorArray = [firstColor.cgColor, secondColor.cgColor, thirdColor.cgColor, forthColor.cgColor, fifthColor.cgColor, sixthColor.cgColor, seventhColor.cgColor]


    static let primaryColor = firstColor
    static let tertiaryColor = thirdColor
    static let cellID = "cellID"
    static let textFieldFont = UIFont.systemFont(ofSize: 20)
    static let textFieldCornerRadius: CGFloat = 20
    static let labelFont = UIFont.boldSystemFont(ofSize: 20)
    static let floatingLabelFont = UIFont.systemFont(ofSize: 16)
    static let buttonFont = UIFont.boldSystemFont(ofSize: 20)
    static let buttonCornerRadius: CGFloat = 20
    static let cellCornerRadius: CGFloat = 25
    static let sowCellBackgroundColor: UIColor = ninthColor
    static let sowControllerBackgroundColor:  UIColor = .white
    static let gestatingColor: UIColor = .green
    static let lactatingColor: UIColor = .orange
    static let openColor: UIColor = .red
    static let weanedColor: UIColor = .purple
}
