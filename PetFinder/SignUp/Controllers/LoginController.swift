//
//  SignInViewController.swift
//  PetFinder
//
//  Created by D i on 16.10.2023.
//

import UIKit
import SnapKit

class LoginController: UIViewController {
    
    //MARK: - UI Components
    
    private let headerView = AuthHeaderView(title: "Hello,\nwelcome back!", subTitle: "Animals are a life. Animals are a basic human need. In various lines of life, humans need animals.")
    
    private let userEmailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    
    private let signInButton = CustomButton(title: "Sign In",hasBackground: true, fontSize: .big)
    private let newUserButton = CustomButton(title: "New user? Create Account", fontSize: .mid)
    private let forgotPasswordButton = CustomButton(title: "Forgot password?", fontSize: .small)
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        self.newUserButton.addTarget(self, action: #selector(didTapNewUser), for: .touchUpInside)
        self.forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        
        //alerts
//        AlertManager.showInvalidEmailAlert(on: self)
    }
  
    
    //MARK: - adding views
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerView)
        self.view.addSubview(userEmailField)
        self.view.addSubview(passwordField)
        
        self.view.addSubview(signInButton)
        self.view.addSubview(newUserButton)
        self.view.addSubview(forgotPasswordButton)
        
    //MARK: - constrains
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview().inset(10)
        }
        
        userEmailField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.top.equalTo(headerView.snp.bottom).offset(250)
            make.height.equalTo(44)
        }
        
        passwordField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.top.equalTo(userEmailField.snp.bottom).offset(6)
            make.height.equalTo(44)
        }
        
        signInButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.bottom.equalTo(self.view.snp.bottom).inset(15)
            make.height.equalTo(44)
        }

        newUserButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.bottom.equalTo(signInButton.snp.bottom).inset(44)
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.bottom.equalTo(passwordField.snp.bottom).offset(30)
        }
       
        
    }
    //MARK: - selectors
    @objc private func didTapSignIn() {
        print("DEBUG PRINT:", "didTapSignIn")
        let vc = HomeController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
    }
    @objc private func didTapNewUser() {
        print("DEBUG PRINT:", "didTapNewUser")
        let vc = RegisterController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func didTapForgotPassword() {
        print("DEBUG PRINT:", "didTapForgotPassword")
        let vc = ForgotPasswordViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
