//
//  SowCell.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 24/02/2021.
//




import UIKit

class SowCell: UITableViewCell {
    var sow: Sow? {
        didSet {
            guard let sow = sow else { return }
            nameLabel.text = sow.name
            checkStages(of: sow)
        }
    }

    func checkStages(of sow: Sow) {
        guard let sowStage = sow.stage else { return }
        guard let stage = Stages(rawValue: sowStage) else { return }
        switch stage {
        case .open: circle.backgroundColor = Constants.openColor
        case .gestating: circle.backgroundColor = Constants.gestatingColor
        case .lactating: circle.backgroundColor = Constants.lactatingColor
        case .others: circle.backgroundColor = Constants.othersColor
        case .gilt: break
        case .weaned: break
            

        }
    }



    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(underLine)
        backgroundColor = .white
        underLine.anchor(top: bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 2))
        addSubview(nameLabel)
        addSubview(circle)
        circle.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        circle.centerYInSuperview(size: .init(width: 30, height: 30))
        nameLabel.anchor(top: nil, leading: circle.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 50))
        nameLabel.centerYInSuperview()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.labelFont
        label.textColor = .black
        return label
    }()

    let underLine: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.primaryColor
        return view
    }()

    let circle : UILabel = {
        let lb = UILabel()
        lb.layer.masksToBounds = true
        lb.layer.cornerRadius = 15
        return lb
    }()

}
