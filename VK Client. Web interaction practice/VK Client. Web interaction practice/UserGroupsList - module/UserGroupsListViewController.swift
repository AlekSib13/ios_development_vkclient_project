//
//  UserGroupsListViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 03.07.2021.
//

import UIKit
import RealmSwift


protocol UserGroupsListViewControllerProtocol: AnyObject {
    var configurator: UserGroupsListConfiguratorProtocol {get}
    var presenter: UserGroupsListPresenterProtocol! {get set}
    
    func returnUserGroupsList(userGroupsListFromDB: [Group]?) -> Void
    func returnLoadedImage(listOfImages: [UIImage]) -> Void
    var listOfAvatars: [UIImage]? {get set}

    
}

class UserGroupsListViewController: UIViewController,UITableViewDataSource, UserGroupsListViewControllerProtocol {
    
//    var realmToken: NotificationToken?
    
    let configurator: UserGroupsListConfiguratorProtocol = UserGroupsListConfigurator()
    var presenter: UserGroupsListPresenterProtocol!

    @IBOutlet weak var groupsList: UITableView!
    
    let cellGroupsListIdentifier = "groupsListTableViewCellIdentifier"
    var resultUserGroupsListFromDB: [Group]?
    var listOfAvatars: [UIImage]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        presenter.fetchUserGroupsList()
        
        groupsList.dataSource = self
        groupsList.register(UINib(nibName: "FriendsListAndGroupsListTableViewCell", bundle: nil), forCellReuseIdentifier: cellGroupsListIdentifier)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        presenter.getUserGroupsListFromDB(cellIdentifier: cellGroupsListIdentifier)
        let numberOfRows = self.resultUserGroupsListFromDB?.count ?? 0
        
        return numberOfRows
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellGroupsListIdentifier, for: indexPath) as? FriendsListAndGroupsListTableViewCell, let resultUserGroupsListFromDBUnwrapped = resultUserGroupsListFromDB  else {return UITableViewCell()}
        
        cell.configureCell(firstName: resultUserGroupsListFromDBUnwrapped[indexPath.row].groupName, lastName: nil, avatar: presenter.loadAvatarIntoCell(cellIndex: indexPath.row))
        return cell
    }
}


extension UserGroupsListViewController {
    func returnUserGroupsList(userGroupsListFromDB: [Group]?) -> Void {
        self.resultUserGroupsListFromDB = userGroupsListFromDB
    }
    
    
    func returnLoadedImage(listOfImages: [UIImage]) -> Void {
        self.listOfAvatars = listOfImages
        groupsList.reloadData()
    }
}


