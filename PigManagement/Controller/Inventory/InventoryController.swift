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
    case others
    case weaned

}


class InventoryController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    init() {
        let layout = UICollectionViewFlowLayout()
            super.init(collectionViewLayout: layout)
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var categories: [Categories] = [
        Categories(title: "Gestating", number: "525", percentage: 80, color: Constants.gestatingColor),
        Categories(title: "Lactating", number: "183", percentage: 12, color: Constants.lactatingColor),
        Categories(title: "Weaned", number: "30", percentage: 4, color: Constants.weanedColor),
        Categories(title: "Open", number: "10", percentage: 3, color: Constants.openColor),
        Categories(title: "Others", number: "5", percentage: 1, color: Constants.othersColor),
        ]



    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(InventoryCell.self, forCellWithReuseIdentifier: Constants.cellID)
        collectionView.register(InventoryHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.headerID)
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
        header.sowEntryButton.addTarget(self, action: #selector(handleEntry), for: .touchUpInside)
        header.boarEntryButton.addTarget(self, action: #selector(handleEntry), for: .touchUpInside)
        return header
    }

    @objc func handleEntry(button: UIButton) {
        let createSowController = CreateSowController()
        if button.currentTitle == "Boar Entry" {
            createSowController.saveButton.backgroundColor = Constants.createBoarColor
            createSowController.segmentControl.isHidden = true
            createSowController.isBoar = true
        } else {
            createSowController.saveButton.backgroundColor = Constants.createSowColor
        }


        present(createSowController, animated: true, completion: nil)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: 80 )
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let headerHeight = (view.frame.height - tabBarHeight) * 0.4
        return CGSize(width: view.frame.width, height: headerHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    var topbarHeight: CGFloat {
            return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
                (self.navigationController?.navigationBar.frame.height ?? 0.0)
        }

    var tabBarHeight: CGFloat {
        return self.tabBarController?.tabBar.frame.size.height ?? 0.0
    }

}
