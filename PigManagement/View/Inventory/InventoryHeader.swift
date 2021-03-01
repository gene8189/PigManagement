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
        addSubview(containerView)
        containerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: frame.width - 100, height: 300))
        containerView.centerXInSuperview()
        containerView.addSubview(circle)
        addSubview(totalLabel)
        backgroundColor = .white
        circle.anchor(top: totalLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 200))
        circle.centerXInSuperview()



        let buttonStack = UIStackView(arrangedSubviews: [sowEntryButton, boarEntryButton])
        addSubview(buttonStack)
        buttonStack.distribution = .fillEqually
        buttonStack.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        buttonStack.constraintHeight(constant: 60)

        totalLabel.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 50))
        totalLabel.centerXInSuperview()
        circle.addSubview(totalNumberLabel)
        totalNumberLabel.centerInSuperview(size: .init(width: 100, height: 100))



    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let containerView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var circle: TotalCircle = {
        let c = TotalCircle(frame: .init(x: 0, y: 0, width: 200, height: 200), categories: categories)
        return c
    }()


    let sowEntryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Gilt / Sow Entry", for: .normal)
        button.tintColor = Constants.buttonGrayColor
        button.setImage(#imageLiteral(resourceName: "female"), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = Constants.buttonGrayColor.cgColor
        button.centerTextAndImage(spacing: 10)
        return button
    }()

    let boarEntryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Boar Entry", for: .normal)
        button.setImage(#imageLiteral(resourceName: "male"), for: .normal)
        button.tintColor = Constants.buttonGrayColor
        button.layer.borderWidth = 1
        button.layer.borderColor = Constants.buttonGrayColor.cgColor
        button.centerTextAndImage(spacing: 10)
        return button
    }()

    let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Sows: "
        label.font = Constants.inventoryCellPercentFont
        label.textAlignment = .center
        return label
    }()

    let totalNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "693"
        label.font = Constants.totalNumberLabelFont
        label.textAlignment = .center
        return label
    }()
}
