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
    
    func returnNews(newsFromDB: [News]?) -> Void
//    func returnNews(newsFromDB: [Any]?) -> Void
}


final class NewsFeedViewController: UIViewController {
    
    let configurator: NewsFeedConfiguratorProtocol = NewsFeedConfigurator()
    var presenter: NewsFeedPresenterProtocol!
    
    @IBOutlet weak var NewsFeedTable: UITableView!
    
    let NewsFeedNewsOwnerCellIdentifier = "newsFeedNewsOwnerCellIdentifier"
    let NewsFeedNewsCommentFromOwnerCellIdentifier = "newsFeedNewsCommentFromOwnerCellIdentifier"
    let NewsFeedNewsPhotoCellIdentifier = "newsFeedNewsPhotoCellIdentifier"
    let NewsFeedNewsAdditionalInfoTableViewCellIdentifier = "newsFeedNewsAdditionalInfoTableViewCellIdentifier"
    
    var resultNewsFromDB: [News]?
    
    
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
        NewsFeedTable.register(UINib(nibName: "newsFeedNewsOwnerCell", bundle: nil), forCellReuseIdentifier: NewsFeedNewsOwnerCellIdentifier)
        NewsFeedTable.register(UINib(nibName: "newsFeedNewsCommentFromOwnerCell", bundle: nil), forCellReuseIdentifier: NewsFeedNewsCommentFromOwnerCellIdentifier )
        NewsFeedTable.register(UINib(nibName: "newsFeedNewsPhotoCell", bundle: nil), forCellReuseIdentifier: NewsFeedNewsPhotoCellIdentifier)
        NewsFeedTable.register(UINib(nibName: "newsFeedNewsAdditionalInfoTableViewCell", bundle: nil), forCellReuseIdentifier: NewsFeedNewsAdditionalInfoTableViewCellIdentifier)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter.getNewsFromDB(cellIdentifier: NewsFeedNewsOwnerCellIdentifier)
        let numberOfSections = self.resultNewsFromDB?.count ?? 0
        
        print("This is qty of results from db in viewController: \(numberOfSections)")
        
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let resultNewsFromDBUnwrapped = resultNewsFromDB else {return 0}
        
        let numberOfRowsPerSection = presenter.returnNumberOfRowsPerSection(newsFromDB: resultNewsFromDBUnwrapped, section: section)
        
        return numberOfRowsPerSection
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        4.0
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}


extension NewsFeedViewController {
    func returnNews(newsFromDB: [News]?) -> Void {
        self.resultNewsFromDB = newsFromDB
    }
}

    // MARK: Alternative version of reading the news via news source (news owner either a friend or group)
//    func returnNews(newsFromDB: [Any]?) -> Void {
//        self.resultNewsFromDB = newsFromDB
//    }
