//
//  TrialVKLoginViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 19.08.2021.
//

import UIKit
import WebKit
import SnapKit


protocol VKLoginPageContentViewControllerProtocol: AnyObject {
}


class VKLoginPageContentViewController: UIViewController, VKLoginPageContentViewControllerProtocol, WKNavigationDelegate {

    var presenter: VKLoginPageContentPresenterProtocol?

    var webView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()
    
    
    init(presenter: VKLoginPageContentPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setConstraints()
        start()
    }
    
    
    func configureView() {
        view.addSubview(webView)
        webView.navigationDelegate = self
    }
    
    
    func setConstraints() {
        webView.snp.makeConstraints {make in
            make.edges.equalToSuperview()
        }
    }
    
    func start() {
        guard let urlRequest = presenter?.getTransitionURL() else {return}
        webView.load(urlRequest)
    }
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if let url = webView.url?.description, !url.contains("redirect") {
            presenter?.authDataToHandle(url: url)
        }
    }
}

