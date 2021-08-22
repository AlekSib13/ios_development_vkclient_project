//
//  TrialVKLoginViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 19.08.2021.
//

import UIKit
import WebKit


protocol VKLoginPageContentViewControllerProtocol: AnyObject {
    var configurator: VKLoginPageContentConfigurfatorProtocol {get}
    var presenter: VKLoginPageContentPresenterProtocol! {get set}
    
}


class VKLoginViewControllerProgrammaticallyMadeLayout: UIViewController, VKLoginPageContentViewControllerProtocol {

    
    
    var configurator: VKLoginPageContentConfigurfatorProtocol = VKLoginPageContentConfigurfator()
    var presenter: VKLoginPageContentPresenterProtocol!
    var webViewContainer = VKLoginPageView()
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webViewContainer)
        webView = webViewContainer.returnWebView()
        webView.navigationDelegate = self
        configurator.configure(with: self)
        presenter.fetchContent(webView: webView)
    }
}


extension VKLoginViewControllerProgrammaticallyMadeLayout: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
//            presenter.moveToUserLoginScreen()
            return}
        
        print("this is url: \(fragment)")
        
        presenter.fetchUserAuthData(urlFragment: fragment)
        decisionHandler(.cancel)
    }
}
