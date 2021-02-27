//
//  CircleProgress.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 28/02/2021.
//

import UIKit

class CircleProgress: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    var progressLyr = CAShapeLayer()
    var trackLyr = CAShapeLayer()

    var progressClr = UIColor.red {
        didSet {
            progressLyr.strokeColor = progressClr.cgColor
        }
    }

    var trackClr = UIColor.black {
        didSet {
            trackLyr.strokeColor = trackClr.cgColor
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
            let centre = CGPoint(x: bounds.midX, y: bounds.midY)

            let circlePath = UIBezierPath(arcCenter: centre,
                                          radius: bounds.maxX/2,
                                          startAngle: 0,
                                          endAngle: 2 * CGFloat.pi,
                                          clockwise: true)

            trackLyr.path = circlePath.cgPath
            trackLyr.fillColor = UIColor.clear.cgColor
            trackLyr.strokeColor = trackClr.cgColor
            trackLyr.lineWidth = 15
            trackLyr.strokeEnd = 1.0

            layer.addSublayer(trackLyr)
        }
}
