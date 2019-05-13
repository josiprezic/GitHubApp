//
//  RepositoriesCollectionViewController.swift
//  JamTestApp
//
//  Created by Josip Rezic on 12/05/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import UIKit
import SnapKit

class RepositoriesCollectionViewController: UICollectionViewController {

    //
    // MARK: - Variables
    //
    
    private final var repositories = [GitHubRepository]()
    private final let activityIndicator = UIActivityIndicatorView()
    private final let refreshControl = UIRefreshControl()
    
    //
    // MARK: - View methods
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.getData()
    }
    
    //
    // MARK: - Methods
    //
    
    @objc private final func getData() {
        GithubApi.getListOfGithubRepositories(forQuery: AppStrings.RepositoriesCollectionVC.defaultQuery) { success, message, data in
            self.activityIndicator.stopAnimating()
            self.refreshControl.endRefreshing()
            guard success else { UIAlertController.showErrorAlert(error: message); return }
            guard let repositoriesData = data as? [GitHubRepository] else { return }
            self.repositories = repositoriesData
            self.collectionView.reloadData()
        }
    }
    
    private final func configureUI() {
        configureNavigationBar()
        configureCollectionView()
        configureActivityIndicator()
        configureRefreshControl()
    }
    
    private final func configureNavigationBar() {
        title = AppStrings.RepositoriesCollectionVC.title
    }

    private final func configureCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 2.0
        flowLayout.minimumLineSpacing = 3.0
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 2, height: UIScreen.main.bounds.height / 3)
        collectionView.collectionViewLayout = flowLayout
        
        collectionView.backgroundColor = AppColors.RepositoriesCollectionVC.lightGray
        self.collectionView!.register(RepositoryCollectionViewCell.self, forCellWithReuseIdentifier: AppStrings.RepositoriesCollectionVC.collectionViewReuseId)
    }
    
    private final func configureActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.size.equalToSuperview()
            make.center.equalToSuperview()
        }
        activityIndicator.startAnimating()
    }
    
    private final func configureRefreshControl() {
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(getData), for: .valueChanged)
        refreshControl.tintColor = AppColors.RepositoriesCollectionVC.black
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
        return repositories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppStrings.RepositoriesCollectionVC.collectionViewReuseId, for: indexPath) as? RepositoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item: GitHubRepository = repositories[indexPath.row]
        cell.configureCell(repositoryName: item.name, ownerName: item.owner, sizeOfTheRepository: item.size, hasWiki: item.hasWiki)
        return cell
    }
}


