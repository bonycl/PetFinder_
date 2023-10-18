//
//  CreateAccountViewController.swift
//  PetFinder
//
//  Created by D i on 16.10.2023.
//

import UIKit
import SnapKit

class RegisterController: UIViewController {
    
    //MARK: - UI Components
    
    private let headerView = AuthHeaderView(title: "Create your account!", subTitle: "Fill out the fields to create an account.")
    
    private let usernameField = CustomTextField(fieldType: .username)
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    private let passwordRepeatField = CustomTextField(fieldType: .password)
    private let newUserButton = CustomButton(title: "Sing Up",hasBackground: true, fontSize: .big)
    private let signInButton = CustomButton(title: "Already have an account? Sign In", fontSize: .mid)
    
    //MARK: - Terms & Conditions + Privacy Policy setup
    private let termsTextView: UITextView = {
        let attributedString = NSMutableAttributedString(string: "By creating an account, you agree to our Terms & Conditions and you acknowledge that you have read our Privacy Policy.")
        
        attributedString.addAttribute(.link, value: "terms://termsAndConditions", range: (attributedString.string as NSString).range(of: "Terms & Conditions"))
        attributedString.addAttribute(.link, value: "privacy://PrivacyPolicy", range: (attributedString.string as NSString).range(of: "Privacy Policy"))
        
        let tv = UITextView()
        tv.linkTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
        tv.backgroundColor = .clear
        tv.attributedText = attributedString
        tv.textColor = .label
        tv.isSelectable = true
        tv.isEditable = false
        tv.delaysContentTouches = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.termsTextView.delegate = self
        
        self.newUserButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - adding views
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(passwordRepeatField)
        
        self.view.addSubview(signInButton)
        self.view.addSubview(termsTextView)
        self.view.addSubview(newUserButton)
        
    //MARK: - constrains
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview().inset(10)
        }
        
        usernameField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.top.equalTo(headerView.snp.bottom).offset(250)
            make.height.equalTo(44)
        }
        
        emailField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.top.equalTo(usernameField.snp.bottom).offset(6)
            make.height.equalTo(44)
        }
        
        passwordField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.top.equalTo(emailField.snp.bottom).offset(6)
            make.height.equalTo(44)
        }
        
        passwordRepeatField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.top.equalTo(passwordField.snp.bottom).offset(6)
            make.height.equalTo(44)
        }
        
        signInButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.top.equalTo(passwordRepeatField.snp.bottom).offset(40)
        }
        
        termsTextView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(newUserButton.snp.top).offset(2)
        }
        
        newUserButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.bottom.equalTo(self.view.snp.bottom).inset(15)
            make.height.equalTo(44)
        }
    }
    //MARK: - selectors
    @objc func didTapSignUp() {

    }
    @objc func didTapSignIn() {
        print("DEBUG PRINT:", "didTapSignIn")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

extension RegisterController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if URL.scheme == "terms" {
            //run any code after click terms&conditions
            print("DEBUG print: terms")
            self.showWebViewerController(with: "https://www.apple.com/legal/internet-services/terms/site.html")
        } else if URL.scheme == "privacy" {
            print("DEBUG print: privacy")
            self.showWebViewerController(with: "https://www.apple.com/legal/internet-services/terms/site.html")
        }
        
        return true
    }
    
    private func showWebViewerController(with urlString: String) {
        let vc = WebViewerViewController(with: urlString)
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true)
    }
    //loop protection
    func textViewDidChangeSelection(_ textView: UITextView) {
        textView.delegate = nil
        textView.selectedTextRange = nil
        textView.delegate = self
    }
}
