//
//  NewsFeedTapeViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 28.05.2022.
//

import Foundation
import UIKit


protocol NewsFeedTapeViewControllerProtocol: AnyObject {
}


class NewsFeedTapeViewController: BaseViewController, NewsFeedTapeViewControllerProtocol {
    
    let presenter: NewsFeedTapePresenterProtocol
    
    init(presenter: NewsFeedTapePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
