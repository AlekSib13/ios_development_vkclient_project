//
//  FriendsListViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 03.07.2021.
//

import UIKit
import RealmSwift

class UserFriendsListViewController: UIViewController, UITableViewDataSource {

//    var realmToken: NotificationToken?

    
    @IBOutlet weak var friendsList: UITableView!
    var friends: Results<Friend>!

    let cellFriendsListIdentifier = "friendsListTableViewCellIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsList.dataSource = self
        friendsList.register(UINib(nibName: "FriendsListAndGroupsListTableViewCell", bundle: nil), forCellReuseIdentifier: cellFriendsListIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dataFromDB = ManagerSingleton.shared.retrieveDataFromDB(cellIdentifier: cellFriendsListIdentifier)
        guard let friends = dataFromDB as? Results<Friend> else {return 0}
        self.friends = friends
        return self.friends.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellFriendsListIdentifier, for: indexPath)
        guard let cellInfo = cell as? FriendsListAndGroupsListTableViewCell else {return UITableViewCell()}
        
        cellInfo.configureCell(firstName: friends[indexPath.row].firstName, lastName: friends[indexPath.row].lastName, avatar: ManagerSingleton.shared.downloadImage(imageLink: friends[indexPath.row].avatar))
        
        
        return cellInfo
    }
}
        
//extension UserFriendsListViewController  {
//
//    func updateTableInfo(){
//
//        guard let resultsFromDb = databaseService.retrieveFromDb(cellIdentifierName: cellFriendsListIdentifier) as? Results<FriendPhotoRealm> else {return}
//
//
//        realmToken = resultsFromDb.observe{[weak self](changes: RealmCollectionChange) in
//            guard let friendsList = self?.friendsList else {return}
//            switch changes {
//            case .initial:
//                friendsList.reloadData()
//            case .update(_, let deletion, let insertion, let modification):
//                friendsList.beginUpdates()
//                friendsList.deleteRows(at: deletion.map({IndexPath(row: $0, section: 0)}), with: .automatic)
//                friendsList.insertRows(at: insertion.map({IndexPath(row: $0, section: 0)}), with: .automatic)
//                friendsList.reloadRows(at: modification.map({IndexPath(row: $0, section: 0)}), with: .automatic)
//                friendsList.endUpdates()
//            case .error(let error):
//                fatalError("\(error)")
//            }
//        }
//    }
//}
//
//
//


