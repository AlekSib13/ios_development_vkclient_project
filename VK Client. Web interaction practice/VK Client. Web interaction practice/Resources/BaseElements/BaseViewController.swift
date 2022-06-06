//
//  BaseViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 06.06.2022.
//

import Foundation
import UIKit


class BaseViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    
    func configureView() {
        view.backgroundColor = UIColor.Colors.blueSky
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

