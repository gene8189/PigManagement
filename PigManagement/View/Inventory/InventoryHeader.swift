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

        addSubview(circleProgressBar)
        circleProgressBar.addSubview(circleLabel)
        circleProgressBar.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 30, left: 20, bottom: 0, right: 0), size: .init(width: 200, height: 200))
        circleLabel.centerInSuperview()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let circleProgressBar: CircleProgress = {
        let cpb = CircleProgress(frame: .init(x: 0, y: 0, width: 200, height: 200))
        cpb.progressClr = Constants.weanedColor
        cpb.percentage = 80
        return cpb
    }()

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
