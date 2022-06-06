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
    
    private struct Constants {
        static let tabBarImageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
    }
    
    let presenter: MainTabBarPresenterProtocol
    
    let newsFeedNavigationController: UINavigationController
    let friendsNavigationController: UINavigationController
    let groupsNavigationController: UINavigationController
    let myProfileNavigationController: UINavigationController
    
    init(presenter: MainTabBarPresenterProtocol, user: UserAuthData) {
        self.presenter = presenter
        self.newsFeedNavigationController = UINavigationController(rootViewController: NewsFeedTapeModuleBuilder.build(user: user))
        self.friendsNavigationController = UINavigationController(rootViewController: FriendsListModuleBuilder.build(user: user))
        self.groupsNavigationController = UINavigationController(rootViewController: GroupListModuleBuilder.build(user: user))
        self.myProfileNavigationController =  UINavigationController(rootViewController: UserProfileModuleBuilder.build())
        
        
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
        tabBar.backgroundColor = .white.withAlphaComponent(0.4)
        
        newsFeedNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage.MainTabTransitionButtonImages.newsFeed, tag: 0)
        newsFeedNavigationController.tabBarItem.imageInsets = Constants.tabBarImageInsets
        
        friendsNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage.MainTabTransitionButtonImages.friends, tag: 1)
        friendsNavigationController.tabBarItem.imageInsets = Constants.tabBarImageInsets
        
        groupsNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage.MainTabTransitionButtonImages.groups, tag: 3)
        groupsNavigationController.tabBarItem.imageInsets = Constants.tabBarImageInsets
        
        myProfileNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage.MainTabTransitionButtonImages.me, tag: 3)
        myProfileNavigationController.tabBarItem.imageInsets = Constants.tabBarImageInsets
        
        viewControllers = [newsFeedNavigationController,
                            friendsNavigationController,
                            groupsNavigationController,
                            myProfileNavigationController]
    }
}
