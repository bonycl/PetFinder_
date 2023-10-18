//
//  ForgotPasswordSecondViewController.swift
//  PetFinder
//
//  Created by D i on 18.10.2023.
//

import UIKit

class ForgotPasswordSecondViewController: UIViewController {
    
    //MARK: - UI Components
    private let headerView = AuthHeaderView(title: "Enter a new Password", subTitle: "Animals are a life. Animals are a basic human need. In various lines of life, humans need animals.")
    private let newPasswordField = CustomTextField(fieldType: .password)
    private let newPasswordRepeatField = CustomTextField(fieldType: .password)
    private let resetPasswordButton = CustomButton(title: "Reset password", hasBackground: true, fontSize: .big)
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        self.resetPasswordButton.addTarget(self, action: #selector(didTapReset), for: .touchUpInside)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    //MARK: - UI setup
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerView)
        self.view.addSubview(newPasswordField)
        self.view.addSubview(newPasswordRepeatField)
        self.view.addSubview(resetPasswordButton)
        
        //MARK: - Constrains
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview().inset(10)
        }
        
        newPasswordField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.top.equalTo(headerView.snp.bottom).offset(250)
            make.height.equalTo(44)
        }
        
        newPasswordRepeatField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.top.equalTo(newPasswordField.snp.bottom).offset(6)
            make.height.equalTo(44)
        }
        
        resetPasswordButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.bottom.equalTo(self.view.snp.bottom).inset(15)
            make.height.equalTo(44)
        }
    }
    //MARK: - selectors

        @objc private func didTapReset() {
            print("DEBUG PRINT:", "didTapReset")
            let vc = LoginController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
}
