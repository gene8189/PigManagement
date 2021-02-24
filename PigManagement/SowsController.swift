//
//  SowsController.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 24/02/2021.
//

import UIKit

class SowsController: UITableViewController {
    var sows = [Sow]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupTableView()
        fetchSows()
    }

    func fetchSows() {
        sows = CoreDataManager.shared.performSowFetch()
        tableView.reloadData()
    }

    func setupTableView() {
        tableView.register(SowCell.self, forCellReuseIdentifier: Constants.cellID)
        
    }

    func setupNavBar() {
        configureNavigationBar(preferredLargeSize: true, title: "Sow Inventory", titleColor: .white, tintColor: .white, backgroundColor: Constants.primaryColor)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
    }

    @objc private func handleAdd() {
        let createSowController = CreateSowController()
        createSowController.modalPresentationStyle = .fullScreen
        createSowController.delegate = self
        self.present(createSowController, animated: true, completion: nil)

    }

}


extension SowsController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellID, for: indexPath) as! SowCell
        let sow = sows[indexPath.row]
        cell.textLabel?.text = sow.name
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sows.count
    }
}

extension SowsController: CreateSowControllerDelegate {
    func didAddSow(sow: Sow) {
        sows.append(sow)
        tableView.reloadData()
    }
}



