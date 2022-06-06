//
//  FriendsListViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 03.07.2021.
//

import UIKit
import RealmSwift

protocol FriendsListViewControllerProtocol: AnyObject {
}


class UserFriendsListViewController: BaseViewController, FriendsListViewControllerProtocol {
    
    var presenter: FriendsListPresenterProtocol
    
    
    init(presenter: FriendsListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}





        
