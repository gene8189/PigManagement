//
//  SowCell.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 24/02/2021.
//


enum Stages: String, CaseIterable {
    case open
    case gestatating
    case lactating
    case culling
}

import UIKit

class SowCell: UITableViewCell {
    var sow: Sow? {
        didSet {
            guard let sow = sow else { return }
            nameLabel.text = sow.name
            guard  let phase = sow.phase else { return }
            var stage = Stages.open
            if let sowStage = phase.stage {
                if stage.rawValue == sowStage {
                    setCircleColor(for: stage)
                }

                if sowStage == "open" {
                    stage = .open
                } else if sowStage == "gestating" {
                    stage = .gestatating
                } else if sowStage == "lactating" {
                    stage = .lactating
                } else {
                    stage = .culling
                }
            }

        }
    }

    func setCircleColor(for stage: Stages) {
        switch stage {
        case .open: circle.backgroundColor = .red
        case .gestatating: circle.backgroundColor = .green
        case .lactating: circle.backgroundColor = .orange
        case .culling: circle.backgroundColor = .purple
        }
    }



    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(underLine)
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
        return label
    }()

    let underLine: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.primaryColor
        return view
    }()

    let circle : UILabel = {
        let lb = UILabel()
//        lb.backgroundColor = .green
        lb.layer.masksToBounds = true
        lb.layer.cornerRadius = 15
        lb.layer.borderWidth = 1
        lb.layer.borderColor = Constants.primaryColor.cgColor
        return lb
    }()

}
