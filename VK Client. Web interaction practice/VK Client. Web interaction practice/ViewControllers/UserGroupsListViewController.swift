//
//  UserGroupsListViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 03.07.2021.
//

import UIKit
import RealmSwift

class UserGroupsListViewController: UIViewController,UITableViewDataSource {
    
    
//    var realmToken: NotificationToken?

    @IBOutlet weak var groupsList: UITableView!
    
    let cellGroupsListIdentifier = "groupsListTableViewCellIdentifier"
    var groups: Results<Group>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupsList.dataSource = self
        groupsList.register(UINib(nibName: "FriendsListAndGroupsListTableViewCell", bundle: nil), forCellReuseIdentifier: cellGroupsListIdentifier)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dataFromDB = ManagerSingleton.shared.retrieveDataFromDB(cellIdentifier: cellGroupsListIdentifier)
        guard let groups = dataFromDB as? Results<Group> else {return 0}
        self.groups = groups
        return self.groups.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellGroupsListIdentifier, for: indexPath)
        guard let cellInfo = cell as? FriendsListAndGroupsListTableViewCell else {return UITableViewCell()}

        cellInfo.configureCell(firstName: groups[indexPath.row].groupName, lastName: nil, avatar: ManagerSingleton.shared.downloadImage(imageLink: groups[indexPath.row].groupAvatar))
        
        return cellInfo
    }
}


//extension UserGroupsListViewController {
//    
//    func updateTableInfo(){
//        
//        guard let resultsFromDb = databaseService.retrieveFromDb(cellIdentifierName: cellGroupsListIdentifier) as? Results<GroupPhotoRealm> else {return}
//        
//        
//        realmToken = resultsFromDb.observe{[weak self](changes: RealmCollectionChange) in
//            guard let groupList = self?.groupsList else {return}
//            switch changes {
//            case .initial:
//                groupList.reloadData()
//            case .update(_, let deletion, let insertion, let modification):
//                groupList.beginUpdates()
//                groupList.deleteRows(at: deletion.map({IndexPath(row: $0, section: 0)}), with: .automatic)
//                groupList.insertRows(at: insertion.map({IndexPath(row: $0, section: 0)}), with: .automatic)
//                groupList.reloadRows(at: modification.map({IndexPath(row: $0, section: 0)}), with: .automatic)
//                groupList.endUpdates()
//            case .error(let error):
//                fatalError("\(error)")
//            }
//        }
//    }
//}


