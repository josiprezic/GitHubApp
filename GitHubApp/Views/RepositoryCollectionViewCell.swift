//
//  RepositoryCollectionViewCell.swift
//  GitHubApp
//
//  Created by Korisnik on 13/05/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class RepositoryCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    let repositoryNameView: TitleAndDescriptionView = {
        let view = TitleAndDescriptionView()
        view.lblTitle.text = "REPOSITORY NAME"
        view.lblDescription.text = "Label"
        return view
    }()
    
    let ownerView: TitleAndDescriptionView = {
        let view = TitleAndDescriptionView()
        view.lblTitle.text = "OWNER"
        view.lblDescription.text = "Label"
        return view
    }()
    
    let sizeView: TitleAndDescriptionView = {
        let view = TitleAndDescriptionView()
        view.lblTitle.text = "SIZE (KB)"
        view.lblDescription.text = "Label"
        return view
    }()
    
    private final func configure() {
        
        let viewSpacing = 60
        
        addSubview(repositoryNameView)
        repositoryNameView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        addSubview(ownerView)
        ownerView.snp.makeConstraints { make in
            make.top.equalTo(repositoryNameView.snp.bottom).offset(viewSpacing)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        addSubview(sizeView)
        sizeView.snp.makeConstraints { make in
            make.top.equalTo(ownerView.snp.bottom).offset(viewSpacing)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    final func configureCell(repositoryName repoName: String, ownerName owner: String, sizeOfTheRepository size: Int, hasWiki wiki: Bool) {
        repositoryNameView.lblDescription.text = repoName
        ownerView.lblDescription.text = owner
        sizeView.lblDescription.text = "\(size)"
        backgroundColor = wiki ? AppColors.RepositoriesCollectionVC.green : AppColors.RepositoriesCollectionVC.darkGray
    }
}
