//
//  VKLoginPageTokenReceiverViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 18.08.2021.
//

import UIKit
import WebKit


//protocol VKLoginPageContentViewControllerProtocol: AnyObject {
//    var configurator: VKLoginPageContentConfigurfatorProtocol {get}
//    var presenter: VKLoginPageContentPresenterProtocol! {get set}
//    
//}
//
//
//class VKLoginPageContentViewController: UIViewController, VKLoginPageContentViewControllerProtocol {
//    var configurator: VKLoginPageContentConfigurfatorProtocol = VKLoginPageContentConfigurfator()
//    var presenter: VKLoginPageContentPresenterProtocol!
//    
//    
//    
//    @IBOutlet weak var webview: WKWebView! {
//        didSet {
//            webview.backgroundColor = .green
//            webview.navigationDelegate = self}
//    }
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configurator.configure(with: self)
//        presenter.fetchContent(webView: webview)
//    
//    }
//
//
//}
//
//extension VKLoginPageContentViewController: WKNavigationDelegate {
//    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
//        
//        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
//            decisionHandler(.allow)
//            return}
//        
//        presenter.fetchUserAuthData(urlFragment: fragment)
//        decisionHandler(.cancel)
//    }
//}
