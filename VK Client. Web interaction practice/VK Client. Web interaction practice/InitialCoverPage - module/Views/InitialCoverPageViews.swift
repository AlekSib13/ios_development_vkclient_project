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
    
    private lazy var infoStack: UIStackView = {
        let infoStack = UIStackView()
        infoStack.axis = .vertical
        return infoStack
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
    }
    
    func setConstraints() {
        infoStack.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(250)
            make.centerX.equalToSuperview()
            
        }
        
        vkLabel.snp.makeConstraints{make in
            make.size.equalTo(100)
            make.centerX.equalToSuperview().inset(15)
        }
        
        mobileClient.snp.makeConstraints{make in
            make.top.equalTo(vkLabel.snp.bottom).offset(15)
            make.center.equalToSuperview()
        }
        
        
    }
}
