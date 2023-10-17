//
//  WebViewerViewController.swift
//  PetFinder
//
//  Created by D i on 17.10.2023.
//

import UIKit
import SnapKit
import WebKit


class WebViewerViewController: UIViewController {
    
    private let webView = WKWebView(frame: CGRect( x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height ))
    private let urlString: String
    
    init(with urlString: String) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        guard let url = URL(string: self.urlString) else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        self.webView.load(URLRequest(url: url))
    }
    //MARK: - adding views
    private func setupUI() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        self.navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        self.view.addSubview(webView)
    }

    @objc private func didTapDone() {
        self.dismiss(animated: true, completion: nil)
    }
    //MARK: - constrains

    
}
