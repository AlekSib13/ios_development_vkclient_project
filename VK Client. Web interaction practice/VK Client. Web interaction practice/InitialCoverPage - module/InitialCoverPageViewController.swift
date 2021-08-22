//
//  LoadingPageViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 05.07.2021.
//

import UIKit

protocol InitialCoverPageViewControllerProtocol: AnyObject {
    var configurator: InitialCoverPageConfiguratorProtocol {get}
    var presenter: InitialCoverPagePresenterProtocol! {get set}
}

class InitialCoverPageViewController: UIViewController, InitialCoverPageViewControllerProtocol {
    
    
    lazy var infoView = InitialCoverPageInfoView()
    
    let configurator: InitialCoverPageConfiguratorProtocol = InitialCoverPageConfigurator()
    var presenter: InitialCoverPagePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(infoView)
        configurator.configure(with: self)}
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.moveToLoginScreen()
        
    }
}
