//
//  TableViewController.swift
//  PetFinder
//
//  Created by D i on 17.10.2023.
//

import UIKit

class HomeController: UITableViewController {
    
    //MARK: - UI Components
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.text = "Loading..."
        label.numberOfLines = 3
        
        return label
    }()
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        
        logOutAnimations()
        
    }

    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogOut))
        
        self.view.addSubview(label)
        
    //MARK: - Constrains
        label.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view.center).inset(230)
        }
    }
    //objc
    @objc private func didTapLogOut() {
        let vc = LoginController()
        self.navigationController?.pushViewController(vc, animated: true)

//        let nav = UINavigationController(rootViewController: vc)
//        nav.modalPresentationStyle = .fullScreen
//        self.present(nav, animated: true, completion: nil)
//    
    }
//MARK: - LogOut text animation
    private func logOutAnimations() {
        label.text = ""
        var charIndex = 0.0
        //creating a loop for animate a label
        let titleText = " 🐶 🐨 🐰\n 🐹 🐼 🐮\n 🐴 🐯 🐑"

        for letter in titleText {
            //using timer. *charIndex is a implementation of additional pause
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
                self.label.text?.append(letter)

            }
            charIndex += 1
        }
    }
}
