//
//  InitialCoverPageInteractor.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 17.08.2021.
//

import Foundation

protocol InitialCoverPageInteractorProtocol {
    var presenter: InitialCoverPagePresenterProtocol? {get}
}


class InitialCoverPageInteractor: InitialCoverPageInteractorProtocol {
    weak var presenter: InitialCoverPagePresenterProtocol?
    let manager: AuthManagerProtocol
    
    
    init(manager: AuthManagerProtocol) {
        self.manager = manager
        checkForCredentials()
    }
    
    func checkForCredentials() {
        manager.readUserAuthData(userCredentials: nil) {[weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let userData):
                self.presenter?.useUserAuthData(userData: userData)
            case .failure(let error):
                print(error)
                self.presenter?.useUserAuthData(userData: nil)
            }
        }
    }
}
