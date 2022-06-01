//
//  InitialCoverPageViews.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 19.08.2021.
//

import Foundation
import UIKit
import SnapKit

class InitialCoverPageInfoView: UIView, ViewProtocol {
    
    
    struct SizeConstants {
        static let sizeOf100: CGFloat = 100
    }
    
    struct OffsetConstants {
        static let offsetOf15: CGFloat = 15
        static let offsetOf30: CGFloat = 30
        static let offsetOf50: CGFloat = 50
        static let offsetOf60: CGFloat = 60
        static let offsetOf250: CGFloat = 250
    }
    
    private var vkLabel: UILabel = {
       let vkLabel = UILabel()
        vkLabel.text = "VK"
        vkLabel.font = UIFont(name: "Arial-BoldMT", size: 50)
        vkLabel.textColor = .white
        return vkLabel
    }()
    
    private var mobileClient: UILabel = {
        let mobileClient = UILabel()
        mobileClient.text = "Mobile Client"
        mobileClient.font = UIFont(name: "Arial", size: 20)
        mobileClient.textColor = .white
        return mobileClient
    }()
    
    private var infoStack: UIStackView = {
        let infoStack = UIStackView()
        infoStack.axis = .vertical
        return infoStack
    }()
    
    private let loader: UIActivityIndicatorView = {
       let loader = UIActivityIndicatorView()
        loader.color = .white
        loader.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        return loader
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
        addSubview(infoStack)
        infoStack.addSubview(vkLabel)
        infoStack.addSubview(mobileClient)
        addSubview(loader)
    }
    
    
    func setConstraints() {
        infoStack.snp.makeConstraints {make in
            make.top.equalToSuperview().inset(OffsetConstants.offsetOf250)
            make.centerX.equalToSuperview()
        }
        
        vkLabel.snp.makeConstraints {make in
            make.size.equalTo(SizeConstants.sizeOf100)
            make.centerX.equalToSuperview().inset(OffsetConstants.offsetOf15)
        }
        
        mobileClient.snp.makeConstraints {make in
            make.top.equalTo(vkLabel.snp.bottom).offset(OffsetConstants.offsetOf15)
            make.center.equalToSuperview()
        }
        
        loader.snp.makeConstraints {make in
            make.top.equalTo(infoStack.snp.bottom).offset(OffsetConstants.offsetOf50)
            make.centerX.equalToSuperview()
        }
    }
    
    
    func startLoaderAnimation() {
        loader.startAnimating()
    }
    
    func stopLoaderAnimation() {
        loader.stopAnimating()
    }
}
