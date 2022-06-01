//
//  LoadingPageViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 05.07.2021.
//

import UIKit
import SnapKit

protocol InitialCoverPageViewControllerProtocol: AnyObject {
    func launchLoader()
    func stopLoader()
}

class InitialCoverPageViewController: UIViewController, InitialCoverPageViewControllerProtocol {
    
    
    var infoView = InitialCoverPageInfoView()
    var presenter: InitialCoverPagePresenterProtocol
    
    
    init(presenter: InitialCoverPagePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setUpConstraints()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        launchLoader()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopLoader()
    }
    
    
    func configureView() {
        view.addSubview(infoView)
    }
    
    
    func setUpConstraints() {
        infoView.snp.makeConstraints {make in
            make.edges.equalToSuperview()
        }
    }
    
    
    func launchLoader() {
        infoView.startLoaderAnimation()
    }
    
    
    func stopLoader() {
        infoView.stopLoaderAnimation()
    }
}
