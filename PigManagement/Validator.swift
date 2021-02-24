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
            if text.isEmpty {
                materialInPutView.line.backgroundColor = UIColor.red
                materialInPutView.label.text = "Invalid input.  "
                materialInPutView.label.textColor = .red
                completion(true)
            }
        }
    }
}
