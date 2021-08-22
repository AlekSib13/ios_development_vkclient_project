//
//  VKLoginPageViews.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 19.08.2021.
//

import Foundation
import UIKit
import SnapKit
import WebKit

class VKLoginPageView: UIView, ViewProtocol {
 
    private var webview: WKWebView = {
        let webview = WKWebView()
        webview.backgroundColor = .none
        return webview
    }()
    
    private lazy var loadingProgressIndicator: UIActivityIndicatorView = {
        let loadingProgressIndicator = UIActivityIndicatorView()
        loadingProgressIndicator.color = .white
        loadingProgressIndicator.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        loadingProgressIndicator.startAnimating()
        return loadingProgressIndicator
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = UIColor(red: 66.0 / 255.0, green: 170.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        configureView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureView() {
        self.addSubview(webview)
        self.addSubview(loadingProgressIndicator)
    }
    
    func setConstraints() {
        webview.snp.makeConstraints{make in
            make.size.equalTo(0)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        loadingProgressIndicator.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
        }
    }
    
    func returnWebView() -> WKWebView {
        return webview
    }
}
