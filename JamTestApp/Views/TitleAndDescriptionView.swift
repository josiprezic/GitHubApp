//
//  TitleAndDescriptionView.swift
//  JamTestApp
//
//  Created by Korisnik on 13/05/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import Foundation
import UIKit

class TitleAndDescriptionView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let lblTitle:UILabel = {
        let label = UILabel()
        label.text = "Repository name"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    let lblDescription: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.textColor = .white
        return label
    }()
    
    private final func configure() {
        addSubview(lblTitle)
        lblTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        addSubview(lblDescription)
        lblDescription.snp.makeConstraints { make in
            make.top.equalTo(lblTitle).offset(12)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }
}
