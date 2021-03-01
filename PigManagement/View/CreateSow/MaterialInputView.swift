//
//  FloatingLabelInput.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 24/02/2021.
//

import UIKit

class MaterialInputView: UIView {
    var placeholder: String
    var color: UIColor

    lazy var label: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        return lb
    }()

    lazy var line: UIView = {
        let view = UIView()
        view.backgroundColor = color
        return view
    }()

    lazy var textField: TextFieldWithPadding = {
        let tf = TextFieldWithPadding()
        tf.font = Constants.textFieldFont
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.layer.cornerRadius = Constants.textFieldCornerRadius
        tf.textColor = .white
        return tf
    }()

    private var isUp: Bool = false {
        didSet {
            styleLabel(isUp: isUp)
            moveLabel(isUp: isUp)
        }
    }

    init(frame: CGRect, placeholder: String, color: UIColor){
        self.placeholder = placeholder
        self.color = color
        super.init(frame: frame)
        setup(placeholder: placeholder)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setup(placeholder: String) {
        let labelWidth = placeholder.widthOfString(usingFont: Constants.labelFont) + 20
        styleLabel(isUp: false)
        addSubview(textField)
        addSubview(label)
        addSubview(line)
        textField.delegate = self
        textField.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor , padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 50))
        label.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 20, bottom: 10, right: 0), size: .init(width: labelWidth, height: 30))
        label.centerYInSuperview()
        line.anchor(top: textField.bottomAnchor, leading: textField.leadingAnchor, bottom: nil, trailing: textField.trailingAnchor, size: .init(width: 0, height: 2))

    }

    private func styleLabel(isUp: Bool) {
        UIView.transition(with: label, duration: 0.15, options: .curveEaseOut) {
            if isUp {
                self.label.text = self.placeholder
                self.label.font =  Constants.floatingLabelFont
                self.label.textColor = self.color
                self.label.backgroundColor = .white
                self.line.backgroundColor = self.color
                
            } else {

                self.label.textColor = self.color
                self.label.text = self.placeholder
                self.label.font = Constants.labelFont
                self.line.backgroundColor = self.color

            }
        }
    }

    private func moveLabel(isUp: Bool) {
        UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseOut) {
            if isUp {
                let offSetX = self.label.frame.width * 0.1
                let translation = CGAffineTransform(translationX: -offSetX, y: -30)
                let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                self.label.transform = translation.concatenating(scale)
            } else {
                self.label.transform = .identity
            }
        }
    }
}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
           let fontAttributes = [NSAttributedString.Key.font: font]
           let size = self.size(withAttributes: fontAttributes)
           return size.width
       }

       func heightOfString(usingFont font: UIFont) -> CGFloat {
           let fontAttributes = [NSAttributedString.Key.font: font]
           let size = self.size(withAttributes: fontAttributes)
           return size.height
       }

       func sizeOfString(usingFont font: UIFont) -> CGSize {
           let fontAttributes = [NSAttributedString.Key.font: font]
           return self.size(withAttributes: fontAttributes)
       }
   }

extension MaterialInputView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if !isUp {
            isUp = true
        }
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {
            return false
        }
        if isUp && text.isEmpty {
            isUp = false
        }
        return true
    }
}

class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}

