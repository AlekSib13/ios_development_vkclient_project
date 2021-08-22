//
//  InitialCoverPageLayOutProgrammaticallyViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 19.08.2021.
//

import UIKit
import SnapKit



class InitialCoverPageLayOutProgrammaticallyViewController: UIViewController {
    
   lazy var infoView = InitialCoverPageInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(infoView)
    }
}





