//
//  InventoryHeader.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 27/02/2021.
//

import UIKit

class InventoryHeader: UICollectionViewCell {
    var circleSize: CGFloat {
        return self.frame.height * 0.5
    }
    var circleHeight: CGFloat {
        return (self.frame.height * 2 / 3 - 50)
    }

    var totalSowsNumber = [Sow]()

    // remove capacity 100%
    // maybe number of gilts instead???
    //so max quota and current quota and number of gilts
    //label set to number of line = 0 and fix the width

    var categories: [Categories] = [
                                    Categories(title: "Gestating", number: "525", percentage: 80, color: Constants.gestatingColor),
                                    Categories(title: "Lactating", number: "183", percentage: 12, color: Constants.lactatingColor),
                                    Categories(title: "Weaned", number: "30", percentage: 4, color: Constants.weanedColor),
                                    Categories(title: "Open", number: "10", percentage: 3, color: Constants.openColor),
                                    Categories(title: "Others", number: "5", percentage: 1, color: Constants.othersColor),]

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(baseView)

        baseView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 10), size: .init(width: 0, height: frame.height * 2 / 3))
        baseView.addSubview(containerView)
        containerView.fillSuperView()
        containerView.addSubview(circle)
        containerView.addSubview(totalLabel)
        containerView.addSubview(totalNumberLabel)
        totalLabel.centerXAnchor.constraint(equalTo: circle.centerXAnchor).isActive = true
        totalLabel.anchor(top: containerView.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        circle.anchor(top: totalLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 10, bottom: 10, right: 0), size: .init(width: circleHeight, height: circleHeight))

        circle.addSubview(totalNumberLabel)
        totalNumberLabel.centerInSuperview()


        let buttonStack = UIStackView(arrangedSubviews: [sowEntryButton, boarEntryButton])
        addSubview(buttonStack)
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 10
        buttonStack.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 10, bottom: 10, right: 10))
        buttonStack.constraintHeight(constant: 40)


        let maxQuoteStack = UIStackView(arrangedSubviews: [maxQuotaLabel, maxQuotaLabelNumber], axis: .vertical)
        maxQuoteStack.distribution = .fillEqually

        let currentQuotaStack = UIStackView(arrangedSubviews: [currentQuota, currentQuotaNumberLabel], axis: .vertical)
        currentQuotaStack.distribution = .fillEqually

        let capacityStack = UIStackView(arrangedSubviews: [giltsLabel, giltsNoLabel], axis: .vertical)
        capacityStack.distribution = .fillEqually
        let labelStacks = UIStackView(arrangedSubviews: [maxQuoteStack,currentQuotaStack , capacityStack], axis: .vertical)
        labelStacks.distribution = .fillProportionally
        labelStacks.alignment = .center

        containerView.addSubview(labelStacks)
        labelStacks.anchor(top: containerView.topAnchor, leading: circle.trailingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 10, left: 20, bottom: 10, right: 10))

        


    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowOpacity = 0.7
        view.layer.shadowRadius = 4.0
        view.clipsToBounds = false
        view.layer.masksToBounds = false
        return view
    }()

    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = Constants.cellCornerRadius
        
        return view
    }()

    lazy var circle: TotalCircle = {
        let c = TotalCircle(frame: .init(x: 0, y: 0, width: circleHeight, height: circleHeight), categories: categories)
        return c
    }()


    let sowEntryButton: CustomButton = {
        let button = CustomButton(type: .system)
        button.setTitle("Gilt / Sow Entry", for: .normal)
        button.tintColor = Constants.buttonGrayColor
        button.setImage(#imageLiteral(resourceName: "female"), for: .normal)
        button.centerTextAndImage(spacing: 10)


        return button
    }()

    let boarEntryButton: CustomButton = {
        let button = CustomButton(type: .system)
        button.setTitle("Boar Entry", for: .normal)
        button.setImage(#imageLiteral(resourceName: "male"), for: .normal)
        button.tintColor = Constants.buttonGrayColor
        button.centerTextAndImage(spacing: 10)

        return button
    }()

    let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Summary: "
        label.textColor = .black
        label.font = Constants.inventoryCellNumberFont
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()

    let totalNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "100 % \n Capacity"
        label.textColor = .black
        label.font = Constants.inventoryCellPercentFont
        label.textAlignment = .center
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }()

    let maxQuotaLabel: UILabel = {
        let label = UILabel()
        label.text = "Max. Quota :"
        label.textColor = .black
        label.font = Constants.inventoryCellNumberFont
        label.numberOfLines = 2
        return label
    }()

    let maxQuotaLabelNumber: UILabel = {
        let label = UILabel()
        label.text = "683"
        label.textColor = .black
        label.textAlignment = .center
        label.font = Constants.inventoryCellNumberFont
        label.sizeToFit()
        return label
    }()

    let currentQuota: UILabel = {
        let label = UILabel()
        label.text = "Curr. Quota :"
        label.textColor = .black
        label.font = Constants.inventoryCellNumberFont
        label.numberOfLines = 2
        return label
    }()

    let currentQuotaNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "666"
        label.textColor = .black
        label.textAlignment = .center
        label.font = Constants.inventoryCellNumberFont
        label.sizeToFit()
        return label
    }()

    let giltsLabel: UILabel = {
        let label = UILabel()
        label.text = "No. of gilts :"
        label.textColor = .black
        label.font = Constants.inventoryCellNumberFont
        label.numberOfLines = 2
        return label
    }()

    let giltsNoLabel: UILabel = {
        let label = UILabel()
        label.text = "60"
        label.textAlignment = .center
        label.textColor = .black
        label.font = Constants.inventoryCellNumberFont
        label.sizeToFit()
        return label
    }()
}
