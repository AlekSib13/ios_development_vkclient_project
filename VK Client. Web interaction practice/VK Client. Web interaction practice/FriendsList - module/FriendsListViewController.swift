//
//  FriendsListViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 03.07.2021.
//

import UIKit
import RealmSwift

protocol FriendsListViewControllerProtocol: AnyObject {

    func returnFriendsList(friendsListFromDB: [Friend]?) -> Void
    func returnLoadedImage(listOfImages: [UIImage]) -> Void
    var listOfAvatars: [UIImage]? {get set}
}


class UserFriendsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FriendsListViewControllerProtocol {
    

    var presenter: FriendsListPresenterProtocol
//    var realmToken: NotificationToken?
    @IBOutlet weak var friendsList: UITableView!
    
    let cellFriendsListIdentifier = "friendsListTableViewCellIdentifier"
    var resultFriendsListFromDB: [Friend]?
    var listOfAvatars: [UIImage]?
    
    init(presenter: FriendsListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.fetchFriendsList()
        
        friendsList.dataSource = self
        friendsList.delegate = self
        
        friendsList.register(UINib(nibName: "FriendsListAndGroupsListTableViewCell", bundle: nil), forCellReuseIdentifier: cellFriendsListIdentifier)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        presenter.getFriendsListFromDB(cellIdentifier: cellFriendsListIdentifier)
        let numberOfRows = self.resultFriendsListFromDB?.count ?? 0
        
        return numberOfRows
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellFriendsListIdentifier, for: indexPath) as? FriendsListAndGroupsListTableViewCell, let resultFriendsListFromDBUnwrapped = resultFriendsListFromDB  else {return UITableViewCell()}
        
        cell.configureCell(firstName: resultFriendsListFromDBUnwrapped[indexPath.row].firstName, lastName: resultFriendsListFromDBUnwrapped[indexPath.row].lastName, avatar: presenter.loadAvatarIntoCell(cellIndex: indexPath.row))
        return cell
    }
}




extension UserFriendsListViewController {
    func returnFriendsList(friendsListFromDB: [Friend]?) -> Void {
        self.resultFriendsListFromDB = friendsListFromDB
    }
    
    
    func returnLoadedImage(listOfImages: [UIImage]) -> Void {
        self.listOfAvatars = listOfImages
        friendsList.reloadData()
    }
}





        
