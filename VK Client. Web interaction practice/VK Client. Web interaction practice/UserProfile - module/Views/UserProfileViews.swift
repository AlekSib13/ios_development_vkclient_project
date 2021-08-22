//
//  UserProfileViews.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 20.08.2021.
//

import Foundation
import UIKit
import SnapKit


class UserProfileView: UIView, ViewProtocol {
    
    private var avatarImage: UIImageView = {
        let avatarImage = UIImageView(image: UIImage(named: "no_img"))
        return avatarImage
    }()
    
    private var firstName: UILabel = {
        let firstName = UILabel()
        firstName.text = "Name"
        return firstName
    }()
    
    private var lastName: UILabel = {
        let lastName = UILabel()
        lastName.text = "Last Name"
        return lastName
    }()
    
    private lazy var userProfileInfoStack: UIStackView = {
        let userProfileInfoStack = UIStackView()
        userProfileInfoStack.axis = .horizontal
        userProfileInfoStack.distribution = .fillProportionally
        return userProfileInfoStack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        configureView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        self.addSubview(avatarImage)
        self.addSubview(userProfileInfoStack)
        userProfileInfoStack.addArrangedSubview(firstName)
        userProfileInfoStack.addArrangedSubview(lastName)
    }
    
    func setConstraints() {
        
        avatarImage.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview().offset(30)
            make.height.equalTo(125)
            make.width.equalTo(125)
        }
        
        userProfileInfoStack.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalTo(avatarImage.snp.trailing).offset(20)
            make.trailing.equalToSuperview()
            make.height.equalTo(150)
        }
        
        firstName.snp.makeConstraints{make in
            make.centerY.equalTo(avatarImage)
        }
        
        lastName.snp.makeConstraints{make in
            make.centerY.equalTo(avatarImage)
        }
    }
}
