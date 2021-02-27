//
//  InventoryCell.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 27/02/2021.
//

import UIKit

class InventoryCell: BaseCell {

    var category: Categories! {
        didSet {
            categoryColorView.backgroundColor = category.color
            titleLabel.text = category.title
            titleLabel.textColor = category.color
            numberLabel.text = category.number
            percentageLabel.text = category.percentage
            circle.trackClr = category.color

        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(categoryColorView)
        addSubview(titleLabel)
        addSubview(numberLabel)
        addSubview(percentageLabel)
        addSubview(circle)
        addSubview(arrowImageView)
        categoryColorView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 7, left: 10, bottom: 7, right: 0), size: .init(width: 10, height: 0))
        titleLabel.anchor(top: topAnchor, leading: categoryColorView.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 7, left: 20, bottom: 0, right: 0), size: .init(width: 100, height: 20))
        numberLabel.anchor(top: titleLabel.bottomAnchor, leading: categoryColorView.trailingAnchor, bottom: categoryColorView.bottomAnchor, trailing: circle.leadingAnchor, padding: .init(top: 0, left: 20 , bottom: 0 , right: 10))
        circle.anchor(top: nil, leading: numberLabel.trailingAnchor, bottom: nil, trailing: percentageLabel.leadingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 10), size: .init(width: 100, height: 100))
        circle.centerYInSuperview()
        percentageLabel.anchor(top: nil, leading: circle.trailingAnchor, bottom: nil, trailing: arrowImageView.leadingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 20), size: .init(width: 70, height: 50))
        percentageLabel.centerYInSuperview()

        arrowImageView.anchor(top: nil, leading: percentageLabel.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 10), size: .init(width: 40, height: 40))
        arrowImageView.centerYInSuperview()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let arrowImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "right-arrow"))
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = Constants.grayColor
        return imageView
    }()


    let categoryColorView: UIView = {
        let view = UIView()
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.inventoryCellTopLabelFont
        label.text = "Gestating"
        return label
    }()

    let numberLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.inventoryCellNumberFont
        label.text = "275"
        return label
    }()

    let percentageLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.inventoryCellPercentFont
        label.textAlignment = .center
        return label
    }()


    let circle: CircleProgress = {
        let circleProgress = CircleProgress(frame: .init(x: 0, y: 0, width: 100, height: 100))
        return circleProgress
    }()


}
