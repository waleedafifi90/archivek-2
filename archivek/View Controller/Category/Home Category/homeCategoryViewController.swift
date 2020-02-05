//
//  homeCategoryViewController.swift
//  archivek
//
//  Created by Waleed Afifi on 30/01/2020.
//  Copyright © 2020 Waleed Afifi. All rights reserved.
//

import UIKit

class homeCategoryViewController: UIViewController {

    @IBOutlet weak var collectionView: GeneralCollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
    }
}

extension homeCategoryViewController {
    func setupView() {
        collectionView.registerNib(withIdentifier: ["homeCategoriesCollectionViewCell"])
        collectionView.objects = []
        collectionView.cellIdentifier = "homeCategoriesCollectionViewCell"
        collectionView.cellSize = CGSize(width: (collectionView.bounds.width - 121) / 2, height: 186)
    }
    
    func fetchData() {
        collectionView.req = HomeCategories().request()
        collectionView.loadCollection()
    }
}
