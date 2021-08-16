//
//  NewsFeedViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.07.2021.
//

import UIKit


protocol NewsFeedViewControllerProtocol: AnyObject, UITableViewDelegate, UITableViewDataSource {
    
    var NewsFeedTable: UITableView! {get}
    var configurator: NewsFeedConfiguratorProtocol {get}
    var presenter: NewsFeedPresenterProtocol! {get}
}


final class NewsFeedViewController: UIViewController {
    
    let configurator: NewsFeedConfiguratorProtocol = NewsFeedConfigurator()
    var presenter: NewsFeedPresenterProtocol!
    
    @IBOutlet weak var NewsFeedTable: UITableView!
    
    let NewsFeedNewsOwnerCellIdentifier = "NewsFeedNewsOwnerCellIdentifier"
    let NewsFeedNewsCommentFromOwnerCellIdentifier = "NewsFeedNewsCommentFromOwnerCellIdentifier"
    let NewsFeedNewsPhotoCellIdentifier = "NewsFeedNewsPhotoCellIdentifier"
    let NewsFeedNewsAdditionalInfoTableViewCellIdentifier = "NewsFeedNewsAdditionalInfoTableViewCellIdentifier"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        presenter.fetchNews()
        
        NewsFeedTable.delegate = self
        NewsFeedTable.dataSource = self
        
        cellRegistration()
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
