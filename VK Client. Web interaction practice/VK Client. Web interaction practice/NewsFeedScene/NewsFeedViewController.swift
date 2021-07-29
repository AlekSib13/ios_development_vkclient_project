//
//  NewsFeedViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.07.2021.
//

import UIKit


protocol NewsFeedViewControllerProtocol: AnyObject, UITableViewDelegate, UITableViewDataSource {
    
    var NewsFeedTable: UITableView! {get}
    
    var configuration: NewsFeedConfigurationProtocol {get}
    var interactor: NewsFeedInteractorProtocol? {get set}
    var router: NewsFeedRouterProtocol? {get set}
}


final class NewsFeedViewController: UIViewController {
    
    @IBOutlet weak var NewsFeedTable: UITableView!
    
    var configuration: NewsFeedConfigurationProtocol = NewsFeedConfiguration()
    var interactor: NewsFeedInteractorProtocol?
    var router: NewsFeedRouterProtocol?
    
    let NewsFeedNewsOwnerCellIdentifier = "NewsFeedNewsOwnerCellIdentifier"
    let NewsFeedNewsCommentFromOwnerCellIdentifier = "NewsFeedNewsCommentFromOwnerCellIdentifier"
    let NewsFeedNewsPhotoCellIdentifier = "NewsFeedNewsPhotoCellIdentifier"
    let NewsFeedNewsAdditionalInfoTableViewCellIdentifier = "NewsFeedNewsAdditionalInfoTableViewCellIdentifier"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NewsFeedTable.delegate = self
        NewsFeedTable.dataSource = self
      
        configuration.configure(with: self)
    }
    
    
}



extension NewsFeedViewController: NewsFeedViewControllerProtocol {
    
    
    func cellRegistration(){
        NewsFeedTable.register(UINib(nibName: "NewsFeedNewsOwnerCell", bundle: nil), forCellReuseIdentifier: NewsFeedNewsOwnerCellIdentifier)
        NewsFeedTable.register(UINib(nibName: "NewsFeedNewsCommentFromOwnerCell", bundle: nil), forCellReuseIdentifier: NewsFeedNewsCommentFromOwnerCellIdentifier )
        NewsFeedTable.register(UINib(nibName: "NewsFeedNewsPhotoCell", bundle: nil), forCellReuseIdentifier: NewsFeedNewsPhotoCellIdentifier)
        NewsFeedTable.register(UINib(nibName: "NewsFeedNewsAdditionalInfoTableViewCell", bundle: nil), forCellReuseIdentifier: NewsFeedNewsAdditionalInfoTableViewCellIdentifier)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}
