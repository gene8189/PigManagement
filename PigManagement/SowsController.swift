//
//  SowsController.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 24/02/2021.
//

import UIKit

class SowsController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupTableView()
    }

    func setupTableView() {
        tableView.register(SowCell.self, forCellReuseIdentifier: Constants.cellID)
        
    }

    func setupNavBar() {
        configureNavigationBar(preferredLargeSize: true, title: "Sow Inventory", titleColor: .white, tintColor: .white, backgroundColor: Constants.primaryColor)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
    }

    @objc private func handleAdd() {
        let navController = CustomNavigationController(rootViewController: CreateSowController())
        present(navController, animated: true, completion: nil)

    }

}


extension SowsController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellID, for: indexPath) as! SowCell
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}



