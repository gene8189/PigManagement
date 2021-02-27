//
//  InventoryController.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 26/02/2021.
//

import UIKit

enum Stages: String, CaseIterable {
    case open
    case gestating
    case lactating
    case weaned

}


class InventoryController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var categories: [Categories] = [
        Categories(title: "Gestating", number: "525", percentage: "80%", color: .green),
        Categories(title: "Lactating", number: "183", percentage: "15%", color: .orange),
        Categories(title: "Open", number: "10", percentage: "3%", color: .red),
        Categories(title: "Others", number: "5", percentage: "2%", color: .purple)]



    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .white
        collectionView.register(InventoryCell.self, forCellWithReuseIdentifier: Constants.cellID)
        collectionView.register(InventoryHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.headerID)
        setupNavBar()
    }

    func setupNavBar() {
        navigationItem.title = "Sow Inventory"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.font: Constants.navBarFont]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.compactAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }



}

//MARKS - Collection view
extension InventoryController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Stages.allCases.count
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellID, for: indexPath) as! InventoryCell
        let category = categories[indexPath.item]
        cell.category = category
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.headerID , for: indexPath) as! InventoryHeader
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let heightRatio: CGFloat = 50 / 100
        let screenHeight = view.frame.height - topbarHeight
        let totalCellsHeight = screenHeight * heightRatio / 4
        return CGSize(width: view.frame.width, height: totalCellsHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let screenHeight = view.frame.height - topbarHeight
        let heightRatio: CGFloat = 40 / 100
        let headerHeight = screenHeight * heightRatio
        return CGSize(width: view.frame.width, height: headerHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    var topbarHeight: CGFloat {
            return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
                (self.navigationController?.navigationBar.frame.height ?? 0.0)
        }

}
