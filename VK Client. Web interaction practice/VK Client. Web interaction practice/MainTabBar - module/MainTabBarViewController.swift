//
//  MainTabBarViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.05.2022.
//

import Foundation
import UIKit


protocol MainTabBarViewControllerProtocol: AnyObject {
}


class MainTabBarViewController: UITabBarController, MainTabBarViewControllerProtocol {
    
    
    let newsFeedNavigationController = UINavigationController(rootViewController: NewsFeedTapeModuleBuilder.build())
    let friendsNavigationController = UINavigationController(rootViewController: FriendslistModuleBuilder.build())
    let myProfileNavigationController = UINavigationController(rootViewController: UserProfileModuleBuilder.build())
    
    
    
    let presenter: MainTabBarPresenterProtocol
    
    init(presenter: MainTabBarPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureControllers()
        view.backgroundColor = .orange.withAlphaComponent(0.3)
    }
    
    
    private func configureControllers() {
        newsFeedNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage.MainTabTransitionButtonImages.newsFeed, tag: 0)
        friendsNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage.MainTabTransitionButtonImages.friends, tag: 1)
        myProfileNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage.MainTabTransitionButtonImages.me, tag: 2)
        
        viewControllers = [newsFeedNavigationController,
                            friendsNavigationController,
                            myProfileNavigationController]
    }
}
