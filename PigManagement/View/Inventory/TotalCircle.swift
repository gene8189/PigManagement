//
//  TotalCircle.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 28/02/2021.
//

import UIKit

class TotalCircle: UIView {
    private let foregroundLayerOne = CAShapeLayer()
    private let foregroundLayerTwo = CAShapeLayer()
    private let foregroundLayerThree = CAShapeLayer()
    private let foregroundLayerFour = CAShapeLayer()
    private let foregroundLayerFive = CAShapeLayer()
    var categories = [Categories]()

    private var pathCenter: CGPoint {
        get {
            return self.convert(self.center, from: self.superview)
        }
    }

    private var radius: CGFloat {
        get {
            return (min(self.frame.width , self.frame.height) - lineWidth) / 2
        }
    }

    public var lineWidth: CGFloat = 25 {
        didSet {
            foregroundLayerOne.lineWidth = lineWidth
            foregroundLayerTwo.lineWidth = lineWidth
            foregroundLayerThree.lineWidth = lineWidth
            foregroundLayerFour.lineWidth = lineWidth
            foregroundLayerFive.lineWidth = lineWidth
        }
    }


    init(frame: CGRect, categories: [Categories]) {
        super.init(frame: frame)
        self.categories = categories
        drawLayerOne()
        drawLayerTwo()
        drawLayerThree()
        drawLayerFour()
        drawLayerFive()


    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let startAngleOne = 1.5 * CGFloat.pi
    private let unitValue = 0.5 * CGFloat.pi  / 25

    private var endAngleOne = CGFloat()
    public func drawLayerOne() {
        let endAngle = startAngleOne + 2 * CGFloat.pi * categories[0].percentage / 100
        let path = UIBezierPath(arcCenter: pathCenter, radius: self.radius, startAngle: startAngleOne, endAngle: endAngle, clockwise: true)
        self.foregroundLayerOne.path = path.cgPath
        self.foregroundLayerOne.strokeColor = categories[0].color.cgColor
        self.foregroundLayerOne.lineWidth = lineWidth
        self.foregroundLayerOne.lineCap = CAShapeLayerLineCap.butt
        self.foregroundLayerOne.fillColor = UIColor.clear.cgColor
        endAngleOne = endAngle
        print("this is end angle one \(endAngleOne)")

        self.layer.addSublayer(foregroundLayerOne)

    }

    private var endAngleTwo = CGFloat()
    public func drawLayerTwo() {
        let endAngle = endAngleOne + 2 * CGFloat.pi * categories[1].percentage / 100
        let path = UIBezierPath(arcCenter: pathCenter, radius: self.radius, startAngle: endAngleOne, endAngle: endAngle, clockwise: true)
        self.foregroundLayerTwo.path = path.cgPath
        self.foregroundLayerTwo.strokeColor = categories[1].color.cgColor
        self.foregroundLayerTwo.lineWidth = lineWidth
        self.foregroundLayerTwo.lineCap = CAShapeLayerLineCap.butt
        self.foregroundLayerTwo.fillColor = UIColor.clear.cgColor
        endAngleTwo = endAngle
        self.layer.addSublayer(foregroundLayerTwo)
    }

    private var endAngleThree = CGFloat()
    public func drawLayerThree() {
        let endAngle = endAngleTwo  + (2 * CGFloat.pi * categories[2].percentage / 100)
        let path = UIBezierPath(arcCenter: pathCenter, radius: self.radius, startAngle: endAngleTwo, endAngle: endAngle, clockwise: true)
        self.foregroundLayerThree.path = path.cgPath
        self.foregroundLayerThree.strokeColor = categories[2].color.cgColor
        self.foregroundLayerThree.lineWidth = lineWidth
        self.foregroundLayerThree.lineCap = CAShapeLayerLineCap.butt
        self.foregroundLayerThree.fillColor = UIColor.clear.cgColor
        endAngleThree = endAngle
        self.layer.addSublayer(foregroundLayerThree)
    }

    private var endAngleFour = CGFloat()
    public func drawLayerFour() {
        let endAngle = endAngleThree + (2 * CGFloat.pi * (categories[3].percentage / 100))
        let path = UIBezierPath(arcCenter: pathCenter, radius: self.radius, startAngle: endAngleThree, endAngle: endAngle, clockwise: true)
        self.foregroundLayerFour.path = path.cgPath
        self.foregroundLayerFour.strokeColor = categories[3].color.cgColor
        self.foregroundLayerFour.lineWidth = lineWidth
        self.foregroundLayerFour.lineCap = CAShapeLayerLineCap.butt
        self.foregroundLayerFour.fillColor = UIColor.clear.cgColor
        endAngleFour = endAngle
        self.layer.addSublayer(foregroundLayerFour)
    }


    public func drawLayerFive() {
        let endAngle = endAngleFour + 2 * CGFloat.pi * (categories[4].percentage / 100)
        let path = UIBezierPath(arcCenter: pathCenter, radius: self.radius, startAngle: endAngleFour, endAngle: endAngle, clockwise: true)
        self.foregroundLayerFive.path = path.cgPath
        self.foregroundLayerFive.strokeColor = UIColor.purple.cgColor
        self.foregroundLayerFive.lineWidth = lineWidth
        self.foregroundLayerFive.lineCap = CAShapeLayerLineCap.butt
        self.foregroundLayerFive.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(foregroundLayerFive)
    }




    
}
