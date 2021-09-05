//
//  NewsFeedOwnerCell.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 29.08.2021.
//



import Foundation

import UIKit
import SnapKit

final class NewsFeedOwnerCell: UITableViewCell {
    
    private static var friendNum = 0
    private static var groupNum = 0
    
    private var newsOwnerAvatar: UIImageView = {
        let newsOwnerAvatar = UIImageView(image: UIImage(named: "no_img"))
        return newsOwnerAvatar
    }()
    
    private let newsOwnerFirstName: UILabel = {
        let newsOwnerFirstName = UILabel()
        newsOwnerFirstName.font = UIFont(name: "Arial", size: 11.0)
        newsOwnerFirstName.textColor = .black
        return newsOwnerFirstName
    }()
    
    private let newsOwnerLastName: UILabel = {
        let newsOwnerLastName = UILabel()
        newsOwnerLastName.font = UIFont(name: "Arial", size: 11.0)
        newsOwnerLastName.textColor = .black
        return newsOwnerLastName
    }()
    
    private let newsDateTime: UILabel = {
        let newsDateTime = UILabel()
        newsDateTime.font = UIFont(name: "Arial", size: 8.0)
        newsDateTime.textColor = .gray
        return newsDateTime
    }()
    
    private lazy var ownerNameNewsDateTimeStack: UIStackView = {
        let ownerNameNewsDateTimeStack = UIStackView()
        ownerNameNewsDateTimeStack.axis = .vertical
        ownerNameNewsDateTimeStack.alignment = .leading
        ownerNameNewsDateTimeStack.distribution = .equalSpacing
        return ownerNameNewsDateTimeStack
    }()
    
    private lazy var cellGeneralStackView: UIStackView = {
        let cellGeneralStackView = UIStackView()
        cellGeneralStackView.axis = .horizontal
        cellGeneralStackView.distribution = .fillProportionally
        return cellGeneralStackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        assemblyUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func assemblyUI() {
        ownerNameNewsDateTimeStack.addArrangedSubview(newsOwnerFirstName)
        ownerNameNewsDateTimeStack.addArrangedSubview(newsDateTime)
        
        cellGeneralStackView.addArrangedSubview(newsOwnerAvatar)
        cellGeneralStackView.addArrangedSubview(ownerNameNewsDateTimeStack)
        
        
        contentView.addSubview(cellGeneralStackView)
        
        cellGeneralStackView.snp.makeConstraints{make in
            make.top.bottom.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview()
        }
    }
    
    func populateCellWithData(fetchedDataModel model: Any) {
        if let model = model as? Group {
            //presenter.loadAvatar or viewController.loadAvatar
            newsOwnerFirstName.text = model.groupName
            newsDateTime.text = model.news.sorted(byKeyPath: "newsDateTime", ascending: false)[NewsFeedOwnerCell.friendNum].newsDateTime as? String ?? "--"
            NewsFeedOwnerCell.friendNum += 1
        }
        else if let model = model as? Friend {
            //presenter.loadAvatar or viewController.loadAvatar
            newsOwnerFirstName.text = model.firstName
            newsOwnerLastName.text = model.lastName
            newsDateTime.text = model.news.sorted(byKeyPath: "newsDateTime", ascending: false)[NewsFeedOwnerCell.groupNum].newsDateTime as? String ?? "--"
            NewsFeedOwnerCell.groupNum += 1
        }
        else {return}
    }
}

