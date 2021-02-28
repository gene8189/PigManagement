//
//  InventoryHeader.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 27/02/2021.
//

import UIKit

class InventoryHeader: UICollectionViewCell {
    var categories: [Categories] = [
                                    Categories(title: "Gestating", number: "525", percentage: 80, color: Constants.gestatingColor),
                                    Categories(title: "Lactating", number: "183", percentage: 12, color: Constants.lactatingColor),
                                    Categories(title: "Weaned", number: "30", percentage: 4, color: Constants.weanedColor),
                                    Categories(title: "Open", number: "10", percentage: 3, color: Constants.openColor),
                                    Categories(title: "Others", number: "5", percentage: 1, color: Constants.othersColor),]

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(circle)
        circle.centerInSuperview(size: .init(width: 300, height: 300))


    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var circle: TotalCircle = {
        let c = TotalCircle(frame: .init(x: 0, y: 0, width: 300, height: 300), categories: categories)
        return c
    }()

    
}
