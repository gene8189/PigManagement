//
//  SowCell.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 24/02/2021.
//

import UIKit

class SowCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layer.cornerRadius = Constants.cellCornerRadius
        addSubview(underLine)
        underLine.anchor(top: bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 2))
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }

    let underLine: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.primaryColor
        return view
    }()


}
