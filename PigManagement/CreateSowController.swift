//
//  CreateSowController.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 24/02/2021.
//

import UIKit

class CreateSowController: UIViewController {
    var isSow: Bool = false {
        didSet {
            if isSow {
                addParityTextField(isSow: isSow)
            } else {
                addParityTextField(isSow: isSow)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        view.backgroundColor = .white
        setupUI()

    }

    func setupNavBar() {
        configureNavigationBar(preferredLargeSize: true, title: "Sow Entry", titleColor: .white, tintColor: .white, backgroundColor: Constants.primaryColor)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
    }

    @objc private func handleCancel() {

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
        containerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        containerView.constraintHeight(constant: 500)
        sowNameTextField.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 50, left: 20, bottom: 0, right: 10), size: .init(width: 0, height: 50))
//
        entryDateTextField.anchor(top: sowNameTextField.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 10), size: .init(width: 0, height: 50))
        segmentControl.anchor(top: entryDateTextField.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 50))







    

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
        let tfView = MaterialInputView(frame: .zero, placeholder: "Entry Date - e.g - dd/mm/yyyy", color: Constants.primaryColor)
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
        let tfView = MaterialInputView(frame: .zero, placeholder: "Parity", color: Constants.primaryColor)
        return tfView
    }()



    private func addParityTextField(isSow: Bool) {
        if isSow {
            containerView.addSubview(parityTextField)
            parityTextField.anchor(top: segmentControl.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 50))
        } else {
            parityTextField.removeFromSuperview()
        }

    }






}
