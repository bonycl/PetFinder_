//
//  ForgotPasswordViewController.swift
//  PetFinder
//
//  Created by D i on 16.10.2023.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    //MARK: - UI Components
    private let headerView = AuthHeaderView(title: "Forgot Password", subTitle: "Animals are a life. Animals are a basic human need. In various lines of life, humans need animals.")
    private let emailField = CustomTextField(fieldType: .email)
    private let signInButton = CustomButton(title: "Already have an account? Sign In", fontSize: .mid)
    private let resetPasswordButton = CustomButton(title: "Next", hasBackground: true, fontSize: .big)

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        self.resetPasswordButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)

    }

    //MARK: - UI setup
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerView)
        self.view.addSubview(emailField)
        self.view.addSubview(signInButton)
        self.view.addSubview(resetPasswordButton)
        
        //MARK: - Constrains
        
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview().inset(10)
        }
        
        emailField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.top.equalTo(headerView.snp.bottom).offset(250)
            make.height.equalTo(44)
        }
        
        resetPasswordButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.bottom.equalTo(self.view.snp.bottom).inset(15)
            make.height.equalTo(44)
        }
        
        signInButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.bottom.equalTo(resetPasswordButton.snp.bottom).inset(40)
            make.height.equalTo(44)
        }
        
    }
    
    //MARK: - Mark selectors
    @objc private func didTapSignIn() {
        print("DEBUG PRINT:", "didTapSignIn")
        self.navigationController?.popToRootViewController(animated: true)

    }
    @objc private func didTapNext() {
        print("DEBUG PRINT:", "didTapNext")
//        let vc = RegisterController()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
   
}
