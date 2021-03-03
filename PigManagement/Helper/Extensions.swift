//
//  Extensions.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 24/02/2021.
//

import UIKit


extension UIViewController {
    func configureNavigationBar(navController: UINavigationController, preferredLargeSize: Bool, title: String, titleColor: UIColor, tintColor: UIColor, backgroundColor: UIColor, imageName: String) {
        navController.navigationBar.prefersLargeTitles = preferredLargeSize
        navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.navigationBar.tintColor = tintColor
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]
        navBarAppearance.backgroundColor = backgroundColor
        navController.navigationBar.compactAppearance = navBarAppearance
        navController.navigationBar.scrollEdgeAppearance = navBarAppearance
        navController.navigationBar.standardAppearance = navBarAppearance

    }
}


extension UIColor {

    func as1ptImage() -> UIImage {
           UIGraphicsBeginImageContext(CGSize(width: 10, height: 10))
           self.setFill()
        UIGraphicsGetCurrentContext()?.fill(.init(x: 0, y: 0, width: 10, height: 10))
           let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
           UIGraphicsEndImageContext()
           return image
       }

    static let darkBlue = UIColor(red: 9/255, green: 45/255, blue: 64/255, alpha: 1)
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }

}


extension UIView {
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach {$0?.isActive = true}
        return anchoredConstraints
    }

    func fillSuperView(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }

    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
    }

        func centerXInSuperview(size: CGSize = .zero) {
            translatesAutoresizingMaskIntoConstraints = false
            if let superviewCenterXAnchor = superview?.centerXAnchor {
                centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
            }
            if size.width != 0 {
                widthAnchor.constraint(equalToConstant: size.width).isActive = true
            }

            if size.height != 0 {
                heightAnchor.constraint(equalToConstant: size.height).isActive = true
            }
        }

    func centerYInSuperview(size: CGSize = .zero) {
            translatesAutoresizingMaskIntoConstraints = false
            if let superviewCenterYAnchor = superview?.centerYAnchor {
                centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
            }
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }

        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        }

        func constraintWidth(constant: CGFloat) {
            translatesAutoresizingMaskIntoConstraints = false
            widthAnchor.constraint(equalToConstant: constant).isActive = true
        }

        func constraintHeight(constant: CGFloat) {
            translatesAutoresizingMaskIntoConstraints = false
            heightAnchor.constraint(equalToConstant: constant).isActive = true
        }
    }

struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}



class IndentedLabel: UILabel {

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        let customRect = rect.inset(by: insets)
        super.drawText(in: customRect)
    }

}


extension UIButton {
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
}


extension UIView {
    func drawShadow(shadowColor: UIColor = UIColor.black, opacity: Float =
                        0.5, offset: CGSize, radius: CGFloat = 5, shouldRasterize : Bool = false) {
        self.clipsToBounds = false
        self.layer.masksToBounds = false
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOpacity = opacity
            self.layer.shadowOffset = offset
            self.layer.shouldRasterize = shouldRasterize
        }
}


extension UIStackView {
    convenience init(arrangedSubviews: [UIView], spacing: CGFloat = 0, axis: NSLayoutConstraint.Axis) {
        self.init(arrangedSubviews: arrangedSubviews)
        if spacing != 0 {
            self.spacing = spacing
        }
        self.axis = axis
    }
}
