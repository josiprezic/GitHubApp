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
    private final var lastQuery = AppStrings.RepositoriesCollectionVC.defaultQuery
    
    //
    // MARK: - Views
    //
    
    private final let activityIndicator = UIActivityIndicatorView()
    private final let refreshControl = UIRefreshControl()
    private lazy var lblEmptyDataSet: UILabel = {
        let lbl = UILabel()
        lbl.text = AppStrings.RepositoriesCollectionVC.noData
        lbl.font = UIFont.boldSystemFont(ofSize: 25)
        lbl.textColor = AppColors.RepositoriesCollectionVC.darkGray
        return lbl
    }()
    
    //
    // MARK: - View methods
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.getData(query: lastQuery)
    }
    
    //
    // MARK: - Methods
    //
    
    private final func getData(query: String) {
        GithubApi.getListOfGithubRepositories(forQuery: query) { success, message, data in
            self.activityIndicator.stopAnimating()
            self.refreshControl.endRefreshing()
            guard success else { UIAlertController.showErrorAlert(error: message); return }
            guard let repositoriesData = data as? [GitHubRepository] else { return }
            self.repositories = repositoriesData
            self.refreshCollectionView()
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
        navigationController?.navigationBar.barStyle = .black
        configureSearchNavBarIcon()
    }

    private final func configureCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 2.0
        flowLayout.minimumLineSpacing = 3.0
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 2, height: 220)
        collectionView.collectionViewLayout = flowLayout
        
        collectionView.backgroundColor = AppColors.RepositoriesCollectionVC.lightGray
        self.collectionView!.register(RepositoryCollectionViewCell.self, forCellWithReuseIdentifier: AppStrings.RepositoriesCollectionVC.collectionViewReuseId)
        
        configureNoDataView()
    }
    
    private final func configureNoDataView() {
        view.addSubview(lblEmptyDataSet)
        lblEmptyDataSet.snp.makeConstraints { make in make.center.equalToSuperview() }
        lblEmptyDataSet.isHidden = true
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
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        refreshControl.tintColor = AppColors.RepositoriesCollectionVC.black
    }
    
    @objc private final func refresh(_ sender: AnyObject) {
        getData(query: lastQuery)
    }
    
    private final func configureSearchNavBarIcon() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchPressed))
        navigationItem.rightBarButtonItem?.tintColor = AppColors.RepositoriesCollectionVC.statusBarTextColor
    }
    
    @objc private final func searchPressed() {
        showSearchDialog()
    }
    
    public final func showSearchDialog() {
        let alert = UIAlertController(title: AppStrings.RepositoriesCollectionVC.searchDialogTitle, message: AppStrings.RepositoriesCollectionVC.searchDialogMessage, preferredStyle: .alert)
        
        //setup alert actions
        let searchAction = UIAlertAction(title: AppStrings.RepositoriesCollectionVC.searchDialogTitle, style: .default, handler: { [weak alert] (_) in
            guard let searchQuery = alert?.textFields?[0].text else { return }
            self.lastQuery = searchQuery
            self.getData(query: searchQuery)
            self.activityIndicator.startAnimating()
        })
        searchAction.isEnabled = false
        let dismissAction = UIAlertAction(title: AppStrings.RepositoriesCollectionVC.dismissActionTitle, style: .cancel, handler: nil)
        
        alert.addAction(dismissAction)
        alert.addAction(searchAction)
        
        //setup alert textField
        alert.addTextField { textField in
            textField.placeholder = AppStrings.RepositoriesCollectionVC.searchPlaceholder
            textField.layer.cornerRadius = 5
            textField.clipsToBounds = true
            
            NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: textField, queue: OperationQueue.main, using: { _ in
                let textCount = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).count ?? 0
                let textIsNotEmpty = textCount > 0
                searchAction.isEnabled = textIsNotEmpty && textField.text?.isAlphanumeric ?? false
            })
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    private final func refreshCollectionView() {
        let range = Range(uncheckedBounds: (0, collectionView.numberOfSections))
        let indexSet = IndexSet(integersIn: range)
        collectionView.reloadSections(indexSet)
        lblEmptyDataSet.isHidden = repositories.count != 0
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


