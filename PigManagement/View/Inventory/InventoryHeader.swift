//
//  InventoryHeader.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 27/02/2021.
//

import UIKit

class InventoryHeader: UICollectionViewCell {


    override init(frame: CGRect) {
        super.init(frame: frame)

        

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    let circleLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "80", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: Constants.inventoryCellNumberFont ])
        attributedString.append(NSAttributedString(string: "\n\nFarrowing rate %", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]))
        label.attributedText = attributedString
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()





    
}
