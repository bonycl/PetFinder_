//
//  AuthHeaderView.swift
//  PetFinder
//
//  Created by D i on 16.10.2023.
//

import UIKit
import SnapKit

class AuthHeaderView: UIView {
    
    //MARK: - UI Components
   private let titleLabel: UILabel = {
        let label = UILabel()
       label.textColor = .label
       label.textAlignment = .left
       label.numberOfLines = 0
       label.font = .systemFont(ofSize: 40, weight: .bold)
       label.text = "error"
       return label
    }()
    
    private let subTitleLabel: UILabel = {
         let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .justified
        label.text = "eRror"
        return label
     }()
    
    //MARK: - LifeCycle
    init(title: String, subTitle: String) {
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - constrains 
    private func setupUI() {
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)

        titleLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().offset(30)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            
        }
       
    }
    
}
