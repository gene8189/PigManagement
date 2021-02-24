//
//  CreateSowController.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 24/02/2021.
//

import UIKit

class CreateSowController: UIViewController {
    var isGilt = true
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        view.backgroundColor = .white
        setupUI()

    }

    func setupNavBar() {
        configureNavigationBar(preferredLargeSize: true, title: "Sow Entry", titleColor: .white, tintColor: .white, backgroundColor: Constants.primaryColor)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSave))
    }

    @objc private func handleCancel() {

    }

    @objc private func handleSave() {

    }

    @objc private func handleTapDismissKeyboard() {
        view.endEditing(true)
    }

    func setupUI() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapDismissKeyboard))
        view.addGestureRecognizer(tap)
        view.addSubview(containerView)
        containerView.addSubview(sowNameTextField)
        containerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        containerView.constraintHeight(constant: 200)
        sowNameTextField.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 50, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 50))
        containerView.addSubview(entryDateTextField)
        entryDateTextField.anchor(top: sowNameTextField.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 50))
        containerView.addSubview(segmentControl)
        segmentControl.anchor(top: entryDateTextField.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: 30, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 40))



    

    }

    let containerView: UIView = {
        let view = UIView()
        return view
    }()

    let sowNameTextField: MaterialInputView = {
        let tfView = MaterialInputView(frame: .zero, placeholder: "Sow Name", color: Constants.primaryColor)
        return tfView
    }()

    let entryDateTextField: MaterialInputView = {
        let tfView = MaterialInputView(frame: .zero, placeholder: "Entry Date - e.g dd/mm/yyyy", color: Constants.primaryColor)
        return tfView
    }()

    let segmentControl: UISegmentedControl = {
        let items = ["Gilt", "Sow"]
        let sg = UISegmentedControl(items: items)
        sg.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : Constants.primaryColor, NSAttributedString.Key.font: Constants.labelFont], for: .normal)
        sg.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: Constants.labelFont], for: .selected)
        sg.selectedSegmentTintColor = Constants.primaryColor
        sg.selectedSegmentIndex = 0

        return sg
    }()



}
