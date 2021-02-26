//
//  SowsController.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 24/02/2021.
//

import UIKit

struct ExpandableCell {
    var name: String
    var sows: [Sow]
}



class SowsController: UITableViewController {
    var allBatches = [ExpandableCell]()
    var sows = [Sow]()
    var totalArray = [[Int]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupTableView()
        fetchSows()
        createBatches()
    }

    func createBatches() {
        let numberOfBatches = Date().calculateTotalWeekAndCreateBatches(Date())
        let batches = numberOfBatches.map { ExpandableCell(name:String($0), sows: []) }
        allBatches = batches
        allBatches.indices.forEach { (batch) in
            allBatches[batch].sows.append(contentsOf: sows.filter { (sow) -> Bool in
                sow.name == allBatches[batch].name
            })
        }
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

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = allBatches[section].name
        return label
        }

    @objc func handleTap(gesture: UITapGestureRecognizer) {
        print("TAP TAP ...later get indexpath")

    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellID, for: indexPath) as! SowCell
//        let sow = sows[indexPath.row]
//        cell.sow = sow
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allBatches[section].sows.count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return allBatches.count
    }

    header




    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteItem = remove(indexPath: indexPath)
        return UISwipeActionsConfiguration(actions: [deleteItem])
    }

    func remove(indexPath: IndexPath) -> UIContextualAction {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
//            let sow = self.sows[indexPath.row]
//            self.sows.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
//            CoreDataManager.shared.deleteSow(sow: sow)
        }
        return deleteAction
    }
}

extension SowsController: CreateSowControllerDelegate {
    func didAddSow(sow: Sow) {
//        sows.append(sow)
        tableView.reloadData()
    }
}



