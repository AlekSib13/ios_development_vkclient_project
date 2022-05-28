//
//  UserProfileViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 20.08.2021.
//
import Foundation
import UIKit

protocol UserProfileViewControllerProtocol: AnyObject {}

class UserProfileViewController: UIViewController, UserProfileViewControllerProtocol {
    
    let presenter: UserProfilePresenterProtocol

    var userProfileView = UserProfileView()
    
    init(presenter: UserProfilePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(userProfileView)
    }

}
