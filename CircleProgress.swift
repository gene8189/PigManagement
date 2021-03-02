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
    }

    var progressLyr = CAShapeLayer()
    var trackLyr = CAShapeLayer()

    var progressClr = Constants.grayColor {
        didSet {
            progressLyr.strokeColor = progressClr.cgColor
        }
    }



    var percentage = CGFloat() {
        didSet {
            setupView(endAngle: calculateEndAngle(percent: percentage))
        }
    }

    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView(endAngle: CGFloat) {
        let pi = CGFloat.pi
        let centre = CGPoint(x: bounds.midX, y: bounds.midY)
        let circlePath = UIBezierPath(arcCenter: centre,
                                      radius: (bounds.maxX - 15)/2,
                                      startAngle: 0,
                                      endAngle: 2 * pi  ,
                                      clockwise: true)
        
        trackLyr.path = circlePath.cgPath
        trackLyr.fillColor = UIColor.clear.cgColor
        trackLyr.strokeColor = UIColor.black.cgColor
        trackLyr.lineWidth = 15
        layer.addSublayer(trackLyr)
        let circlePath2 = UIBezierPath(arcCenter: center, radius: (bounds.maxX - 15)/2, startAngle: 1.5 * pi, endAngle: endAngle, clockwise: true)
        progressLyr.path = circlePath2.cgPath
        progressLyr.fillColor  = UIColor.clear.cgColor
        progressLyr.strokeColor = progressClr.cgColor
        progressLyr.lineWidth = 15
        layer.addSublayer(progressLyr)


    }

    private func calculateEndAngle(percent: CGFloat) -> CGFloat {
        let startAngle = 1.5 * CGFloat.pi
        let endAngle = startAngle +  percent / 100 * 2 * CGFloat.pi
        return endAngle
    }

    @objc func circleAnimate() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.fromValue = 0
        basicAnimation.toValue = 1
        basicAnimation.duration = 0.5
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        progressLyr.add(basicAnimation, forKey: "basicAnimation")
    }
}
