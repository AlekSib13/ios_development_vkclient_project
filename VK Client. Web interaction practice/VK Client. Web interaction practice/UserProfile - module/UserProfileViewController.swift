//
//  UserProfileViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 20.08.2021.
//

import UIKit

class UserProfileViewController: UIViewController {

    var userProfileView = UserProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(userProfileView)
    }

}
