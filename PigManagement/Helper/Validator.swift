//
//  Validator.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 24/02/2021.
//

import UIKit



struct Validator {
    static let shared = Validator()
    func validateTextFieldInput(textFields: [MaterialInputView], completion: @escaping (Bool)->()) {
        textFields.forEach { (materialInPutView) in
            guard let text = materialInPutView.textField.text else { return }
            if materialInPutView == textFields[0] && text.isEmpty {
                materialInPutView.line.backgroundColor = UIColor.red
                materialInPutView.label.text = "Name is required!"
                materialInPutView.label.textColor = .red
                completion(true)
            } else if materialInPutView != textFields[0] && text.isEmpty {
                materialInPutView.line.backgroundColor = UIColor.red
                materialInPutView.label.text = "Invalid input."
                materialInPutView.label.textColor = .orange
                completion(false)
            }
        }
    }
}
