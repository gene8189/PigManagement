//
//  SowsController.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 24/02/2021.
//

import UIKit

struct ExpandableCell {
    var isExapanded: Bool
    var names: String
    var sows = [Sow]()
}



class SowsController: UITableViewController {

    var twoDimensionalArray = [ExpandableCell]()
    var totalArray = [[Int]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupTableView()
//        fetchSows()
        print(Date().calculateTotalWeekAndCreateBatches(Date()))
    }



    func fetchSows() {
//        sows = CoreDataManager.shared.performSowFetch()
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
        // Make 54 sets. 52 batches for dividing total sows and one extra to contain those open sows and one extra to be caution
        // make indented label for headerview.
        let totalWeek: [Int] = Date().calculateTotalWeekAndCreateBatches(Date())
        twoDimensionalArray = totalWeek.map { ExpandableCell(isExapanded: false, names: String($0))}
        let labelTitle = twoDimensionalArray[section].names
        let label = UILabel()
        label.text = labelTitle
        label.backgroundColor = .lightGray
        label.isUserInteractionEnabled = true
        label.textAlignment = .left
        label.layer.borderWidth = 1
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
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
        return 0
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Date().calculateTotalWeekAndCreateBatches(Date()).count
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



