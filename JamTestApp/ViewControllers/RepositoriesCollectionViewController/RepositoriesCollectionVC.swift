//
//  RepositoriesCollectionViewController.swift
//  JamTestApp
//
//  Created by Josip Rezic on 12/05/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import UIKit

class RepositoriesCollectionViewController: UICollectionViewController {

    //
    // MARK: - View methods
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //
    // MARK: - Methods
    //
    
    private final func configureUI() {
        configureNavigationBar()
        configureCollectionView()
    }
    
    private final func configureNavigationBar() {
        title = AppStrings.RepositoriesCollectionVC.title
    }

    private final func configureCollectionView() {
        collectionView.backgroundColor = AppColors.RepositoriesCollectionVC.lightGray
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: AppStrings.RepositoriesCollectionVC.collectionViewReuseId)
    }
}

//
// MARK: - Extension - UICollectionViewDataSource
//

extension RepositoriesCollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AppStrings.RepositoriesCollectionVC.strings.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppStrings.RepositoriesCollectionVC.collectionViewReuseId, for: indexPath)
        cell.backgroundColor = AppColors.RepositoriesCollectionVC.darkGray
        cell.layer.cornerRadius = 5
        cell.clipsToBounds = true
        return cell
    }
}
