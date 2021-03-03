//
//  MainTabBarController.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 02/03/2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            createNavController(viewController: InventoryController(), title: "Inventory", imageName: "home"),
            createNavController(viewController: UIViewController(), title: "Summary", imageName: "file")
        ]

    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
    }
}
