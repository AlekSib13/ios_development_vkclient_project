//
//  GroupsViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 06.06.2022.
//

import Foundation

protocol GroupsListViewControllerProtocol: AnyObject {}

class GroupsListViewController: BaseViewController, GroupsListViewControllerProtocol {
    
    let presenter: GroupsListPresenterProtocol
    
    init(presenter: GroupsListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

