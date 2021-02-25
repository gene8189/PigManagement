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
        tableView.backgroundColor = .black
        
    }

    func setupNavBar() {
       
        configureNavigationBar(preferredLargeSize: true, title: "Sow Inventory", titleColor: .white, tintColor: .white, backgroundColor: Constants.primaryColor)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
    }

    @objc private func handleAdd() {
        let createSowController = CreateSowController()
        createSowController.modalPresentationStyle = .overCurrentContext

        createSowController.delegate = self
        self.present(createSowController, animated: true, completion: nil)

    }

}


extension SowsController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellID, for: indexPath) as! SowCell
        let sow = sows[indexPath.row]
        cell.sow = sow
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sows.count
    }


    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteItem = remove(indexPath: indexPath)
        return UISwipeActionsConfiguration(actions: [deleteItem])
    }

    func remove(indexPath: IndexPath) -> UIContextualAction {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            let sow = self.sows[indexPath.row]
            self.sows.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            CoreDataManager.shared.deleteSow(sow: sow)
        }
        return deleteAction
    }
}

extension SowsController: CreateSowControllerDelegate {
    func didAddSow(sow: Sow) {
        sows.append(sow)
        tableView.reloadData()
    }
}



