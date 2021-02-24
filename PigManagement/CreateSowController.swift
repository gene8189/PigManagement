//
//  CreateSowController.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 24/02/2021.
//

import UIKit
import CoreData

class CreateSowController: UIViewController {
    var isSow: Bool = false {
        didSet {
                parityTextField.isHidden = !isSow
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupUI()

    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @objc private func handleTapDismissKeyboard() {
        view.endEditing(true)
    }

    func setupUI() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapDismissKeyboard))
        view.addGestureRecognizer(tap)
        view.addSubview(containerView)
        containerView.addSubview(sowNameTextField)
        containerView.addSubview(entryDateTextField)
        containerView.addSubview(segmentControl)
        containerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 0))
        containerView.constraintHeight(constant: 500)
        sowNameTextField.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 70, left: 20, bottom: 0, right: 10), size: .init(width: 0, height: 50))
//
        entryDateTextField.anchor(top: sowNameTextField.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 10), size: .init(width: 0, height: 50))
        segmentControl.anchor(top: entryDateTextField.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 50))
        containerView.addSubview(parityTextField)
        parityTextField.anchor(top: segmentControl.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 50))
        containerView.addSubview(cornerDismissButton)
        cornerDismissButton.anchor(top: containerView.topAnchor, leading: nil, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10), size: .init(width: 64, height: 64))

        containerView.addSubview(saveButton)
        containerView.addSubview(dismissButton)
        saveButton.anchor(top: nil, leading: containerView.leadingAnchor, bottom: dismissButton.topAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 20, right: 20), size: .init(width: 0, height: 50))
        dismissButton.anchor(top: nil, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 20, right: 20), size: .init(width: 0, height: 50))

    }

    let containerView: UIView = {
        let view = UIView()
        return view
    }()

    //MARK: - sowName Textfield
    lazy var sowNameTextField: MaterialInputView = {
        let tfView = MaterialInputView(frame: .zero, placeholder: "Enter Name ", color: Constants.primaryColor)
        return tfView
    }()

    //MARK: - Parity Textfield
    let entryDateTextField: MaterialInputView = {
        let tfView = MaterialInputView(frame: .zero, placeholder: "Entry Date - e.g - dd/MM/yyyy", color: Constants.primaryColor)
        return tfView
    }()

    //MARK: - Segment control
    let segmentControl: UISegmentedControl = {
        let items = ["Gilt", "Sow"]
        let sg = UISegmentedControl(items: items)
        sg.selectedSegmentIndex = 0
        sg.selectedSegmentTintColor = Constants.primaryColor
        sg.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: Constants.labelFont], for: .selected)
        sg.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Constants.primaryColor, NSAttributedString.Key.font: Constants.labelFont ], for: .normal)
        sg.addTarget(self, action:#selector(handleSelect), for:.valueChanged)
        return sg
    }()

    @objc func handleSelect(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 1 {
            isSow = true
        } else {
            isSow = false
        }
    }

    //MARK: - Parity Textfield
    let parityTextField: MaterialInputView = {
        let tfView = MaterialInputView(frame: .zero, placeholder: "Parity             ", color: Constants.primaryColor)
        tfView.isHidden = true
        return tfView
    }()



    lazy var cornerDismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = Constants.primaryColor
        button.setImage(UIImage(named: "dismiss"), for: .normal)
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
    }()

    @objc private func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }

    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = Constants.buttonFont
        button.backgroundColor = Constants.primaryColor
        button.layer.cornerRadius = Constants.buttonCornerRadius
        button.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
        return button
    }()

    @objc private func handleSave() {
        checkForEmptyTextFields()
        guard let name = sowNameTextField.textField.text else { return }

        guard let parity = parityTextField.textField.text else { return }
        print("parity is ......\(parity)")

    }



    func checkForEmptyTextFields() {
        var textFields = [MaterialInputView]()
        if !isSow {
            textFields = [sowNameTextField]
        } else {
        textFields = [sowNameTextField, parityTextField]
        }
        Validator.shared.validateTextFieldInput(textFields: textFields) { (bool) in
            if bool {
                self.presentAlert(title: "Error 101", message: "Invalid name. Please fill up the forms")
            }
        }
    }

    func presentAlert(title:String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

    

    lazy var dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Dismiss", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = Constants.buttonFont
        button.backgroundColor = .red
        button.layer.cornerRadius = Constants.buttonCornerRadius
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
    }()




}
