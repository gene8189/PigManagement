//
//  CreateSowController.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 24/02/2021.
//

import UIKit
import CoreData


protocol CreateSowControllerDelegate {
    func didAddSow(sow: Sow)
}

class CreateSowController: UIViewController {
    var isBoar: Bool = false


    static var  primaryColor = UIColor(hexString: "FF477E")
    var isSow: Bool = false {
        didSet {
                parityTextField.isHidden = !isSow
        }
    }
    var delegate: CreateSowControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @objc private func handleTapDismissKeyboard() {
        view.endEditing(true)
    }

    func setupUI() {
        if isBoar {
            CreateSowController.primaryColor = #colorLiteral(red: 0.1978052557, green: 0.7340510488, blue: 0.8285663128, alpha: 1)
        } else {
            CreateSowController.primaryColor = #colorLiteral(red: 0.9791933894, green: 0.5211732984, blue: 0.6319996715, alpha: 1)
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapDismissKeyboard))
        view.addGestureRecognizer(tap)
        view.addSubview(containerView)
        containerView.addSubview(sowNameTextField)
        containerView.addSubview(entryDateTextField)
        containerView.addSubview(segmentControl)
        containerView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        containerView.constraintHeight(constant: 500)
        sowNameTextField.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 70, left: 20, bottom: 0, right: 10), size: .init(width: 0, height: 50))
        entryDateTextField.anchor(top: sowNameTextField.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 10), size: .init(width: 0, height: 50))
        segmentControl.anchor(top: entryDateTextField.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 50))
        containerView.addSubview(parityTextField)
        parityTextField.anchor(top: segmentControl.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 50))
        containerView.addSubview(cornerDismissButton)
        cornerDismissButton.anchor(top: containerView.topAnchor, leading: nil, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10), size: .init(width: 64, height: 64))

        containerView.addSubview(saveButton)
        containerView.addSubview(dismissButton)
        saveButton.anchor(top: parityTextField.bottomAnchor, leading: containerView.leadingAnchor, bottom: dismissButton.topAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 20, right: 20), size: .init(width: 0, height: 50))
        dismissButton.anchor(top: saveButton.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 50))
        sowNameTextField.textField.becomeFirstResponder()
    }

    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()

    let blurVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))

    //MARK: - sowName Textfield
    lazy var sowNameTextField: MaterialInputView = {
        let tfView = MaterialInputView(frame: .zero, placeholder: "Enter Name            ", color: CreateSowController.primaryColor)
        return tfView
    }()



    //MARK: - Parity Textfield
    lazy var entryDateTextField: MaterialInputView = {
        let tfView = MaterialInputView(frame: .zero, placeholder: "Entry Date - e.g - dd.MM.yy", color: CreateSowController.primaryColor)
        return tfView
    }()

    //MARK: - Segment control
    lazy var segmentControl: UISegmentedControl = {
        let items = ["Gilt", "Sow"]
        let sg = UISegmentedControl(items: items)
        sg.selectedSegmentIndex = 0
        sg.selectedSegmentTintColor = CreateSowController.primaryColor
        sg.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: Constants.labelFont], for: .selected)
        sg.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: CreateSowController.primaryColor, NSAttributedString.Key.font: Constants.labelFont ], for: .normal)
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
    lazy var parityTextField: MaterialInputView = {
        let tfView = MaterialInputView(frame: .zero, placeholder: "Parity             ", color: CreateSowController.primaryColor)
        tfView.isHidden = true
        return tfView
    }()



    lazy var cornerDismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = CreateSowController.primaryColor
        button.setImage(UIImage(named: "dismiss"), for: .normal)
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
    }()

    @objc private func handleDismiss() {
        isBoar = false
        dismiss(animated: true, completion: nil)
    }

    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = Constants.buttonFont
        button.backgroundColor = CreateSowController.primaryColor
        button.layer.cornerRadius = Constants.buttonCornerRadius
        button.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
        return button
    }()

    @objc private func handleSave() {
        checkForEmptyTextFields()

        let date = entryDateTextField.textField.text
        var parity = parityTextField.textField.text
        if !isSow {
            parity = "Gilt"
        }
        if sowNameTextField.textField.text != "" {
            guard let name = sowNameTextField.textField.text else { return }
            let tuple = CoreDataManager.shared.createSow(name: name, entryDate: date , parity: parity)
            if tuple.1 != nil {
                print(tuple.1!)
            }
            dismiss(animated: true) {
                guard let sow = tuple.0 else { return }
                
                self.delegate?.didAddSow(sow: sow)
            }
        }
    }



    func checkForEmptyTextFields() {
        let textFields = [sowNameTextField,entryDateTextField, parityTextField]
        Validator.shared.validateTextFieldInput(textFields: textFields) { (bool) in
            if bool {
                self.presentAlert(title: "Name is required!", message: "Please enter the name.")
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
        button.backgroundColor = Constants.openColor
        button.layer.cornerRadius = Constants.buttonCornerRadius
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
    }()




}
